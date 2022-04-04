%%
%% This is file `njuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2021 - 2022
%% by Nanjing University Linux User Group
%% <git+nju-lug-email-3104-issue-@yaoge123.cn>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
%% To produce the documentation run the original source files ending with
%% `.dtx' through XeTeX.
%% 
\NeedsTeXFormat{LaTeX2e}
\GetIdInfo $Id: njuthesis.dtx 0.16.1 2022-03-27 13:00:00 +0800 NJU LUG <git+nju-lug-email-3104-issue-@yaoge123.cn>$
  {Thesis template for Nanjing University}
\ProvidesExplClass{njuthesis}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xtemplate, l3keys2e }
\msg_new:nnn { njuthesis } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\
    Please~ update~ an~ up-to-date~ version~ of~ the~
    bundles~ "l3kernel"~ and~ "l3packages"~ using~
    your~ TeX~ package~ manager~ or~ from~ CTAN.
  }
\clist_map_inline:nn { xtemplate, l3keys2e }
  {
    \@ifpackagelater {#1} { 2020/10/01 }
      { } { \msg_error:nnn { njuthesis } { l3-too-old } {#1} }
  }
\msg_new:nnn { njuthesis } { unsupported-engine }
  {
    The~ njuthesis~ class~ requires~ either~
    XeTeX~ or~ LuaTeX. \\
    "#1"~ is~ not~ supported~ at~ present.~
    You~ must~ change~ your~ typesetting~ engine~
    to~ "xelatex"~ or~ "lualatex".
  }
\bool_lazy_or:nnF
  { \sys_if_engine_xetex_p:  }
  { \sys_if_engine_luatex_p: }
  { \msg_fatal:nnx { njuthesis } { unsupported-engine } { \c_sys_engine_str } }
\box_new:N   \l__nju_tmp_box
\clist_new:N \l__nju_tmp_clist
\dim_new:N   \l__nju_tmp_dim
\int_new:N   \l__nju_tmp_int
\seq_new:N   \l__nju_tmp_seq
\tl_new:N    \l__nju_tmp_tl
\int_new:N \g__nju_info_degree_int
\int_new:N \l__nju_info_diploma_int
\int_new:N \g__nju_info_type_int
\tl_new:N  \l__nju_info_degree_tl
\tl_new:N  \l__nju_info_diploma_tl
\tl_new:N  \l__nju_info_type_tl
\tl_new:N  \l__nju_info_type_en_tl
\bool_new:N \g__nju_twoside_bool
\bool_set_true:N \g__nju_twoside_bool
\bool_new:N \l__nju_second_supv_bool
\tl_new:N \l__nju_info_supv_full_tl
\tl_new:N \l__nju_info_supv_full_en_tl
\tl_new:N \g__nju_latin_font_tl
\tl_new:N \g__nju_cjk_font_tl
\tl_new:N \g__nju_config_tl
\clist_new:N \g__nju_theorem_type_clist
\tl_new:N \l__nju_info_sm_date_tl
\tl_new:N \l__nju_info_sm_date_en_tl
\tl_new:N \l__nju_info_df_date_tl
\tl_const:Nx \c__nju_today_tl
  {
    \int_to_arabic:n { \c_sys_year_int  } -
    \int_to_arabic:n { \c_sys_month_int } -
    \int_to_arabic:n { \c_sys_day_int   }
  }
\clist_const:Nn \c__nju_name_type_clist
  { 学位论文, 毕业设计 }
\clist_const:Nn \c__nju_name_type_en_clist
  { THESIS, DESIGN }
\clist_const:Nn \c__nju_name_degree_clist
  { 学士, 硕士, 硕士专业, 博士 }
\clist_const:Nn \c__nju_name_degree_en_clist
  { Bachelor, Master, Master, Doctor~of~Philosophy }
\clist_const:Nn \c__nju_month_en_clist
  {
    January, February, March, April, May, June,
    July, August, September, October, November, December
  }
\cs_new:Nn \__nju_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Nn \__nju_qquad: { \skip_horizontal:n { 2 em } }
\cs_new:Nn \__nju_vskip: { \skip_vertical:n   { 1   ex } }
\cs_new:Nn \__nju_hskip: { \skip_horizontal:n { 0.3 em } }
\cs_new_protected:Npn \__nju_vskip:N #1
  {
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:n { - \baselineskip - \lineskip }
    \skip_vertical:N #1
  }
\cs_new_protected:Npn \__nju_define_name:nn #1#2
  { \tl_const:cn { c__nju_name_ #1    _tl } { #2 } }
\cs_new_protected:Npn \__nju_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__nju_name_ #1    _tl } { #2 }
    \tl_const:cn { c__nju_name_ #1 _en_tl } { #3 }
  }
\cs_new_protected:Npn \__nju_add_theorem_type:nnn #1#2#3
  {
    \clist_gput_right:Nn \g__nju_theorem_type_clist { #1 }
    \__nju_define_name:nnn { #1 } { #2 } { #3 }
  }
\cs_new:Npn \__nju_name:n #1 { \tl_use:c { c__nju_name_ #1 _tl } }
\cs_new:Npn \__nju_info:n #1 { \tl_use:c { l__nju_info_ #1 _tl } }
\cs_new_protected:Npn \__nju_ulined_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \rule [ -0.55 ex ] { #1 } { 0.4 pt }
    \skip_horizontal:n { -#1 }
    \hbox_to_wd:nn { #1 } { \hfil #2 \hfil }
  }
\cs_new_protected:Npn \__nju_spread_box:nnn #1#2#3
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { #1 }
      { #2 \tl_map_inline:nn { #3 } { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \__nju_spread_box:nnn { nnV }
\cs_generate_variant:Nn \__nju_spread_box:nnn { nnx }
\cs_new_protected:Npn \__nju_multiline_box:nnnn #1#2#3#4
  {
    \int_set:Nn #1 { 1 }
    \int_do_until:nn { #1 > #3 }
      {
        \__nju_ulined_center_box:nn { #4 }
          { \clist_item:Nn #2 { #1 } } \\
        \int_incr:N #1
      }
  }
\cs_new_protected:Npn \__nju_put_inempty_seg:nnn #1#2#3
  {
    \tl_set:Nx \l__nju_tmp_tl
      { \tl_range:Nnn { #1 } { #2 } { #2 + #3 - 1 } }
    \tl_if_empty:NF \l__nju_tmp_tl
      { \clist_put_right:NV \l__nju_tmp_clist { \l__nju_tmp_tl } }
  }
\cs_new_protected:Npn \__nju_uline:n #1
  {
    \mode_leave_vertical:
    \rule [ -0.55 ex ] { #1 } { 0.4 pt }
    \skip_horizontal:n { -#1 }
  }
\cs_new_protected:Npn \__nju_uuline:n #1
  {
    \mode_leave_vertical:
    \rule [ -0.5 ex ] { #1 } { 0.4 pt }
    \skip_horizontal:n { -#1 }
    \rule [ -0.6 ex ] { #1 } { 0.4 pt }
    \skip_horizontal:n { -#1 }
  }
\cs_new:Npn \__nju_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__nju_tmp_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__nju_tmp_box }
  }
\cs_generate_variant:Nn \__nju_get_text_width:Nn { NV }
\cs_new_protected:Npn \__nju_full_uline:Nn #1#2
  {
    \__nju_get_text_width:Nn #1 { #2 }
    \dim_set:Nn #1 { \textwidth - #1 } #2
  }
\cs_generate_variant:Nn \__nju_full_uline:Nn { NV }
\cs_new_protected:Npn \__nju_uline_entry:Nnnn #1#2#3#4
  {
    \__nju_full_uline:NV #1 { \__nju_name:n { #2 } #4 }
    \__nju_ulined_center_box:nn { #1 } { \__nju_info:n { #3 } }
  }
\cs_new_protected:Npn \__nju_uline_bientry:Nnnn #1#2#3#4
  {
    \__nju_full_uline:NV #1 { \__nju_name:n { #2 } #4 }
    \dim_sub:Nn #1 { \textwidth / 2 }
    \__nju_ulined_center_box:nn { #1 } { \__nju_info:n { #3 } }
  }
\cs_new:Npn \__nju_date:www #1-#2-#3 \q_stop
  { \__zhnum_date_aux:nnn { #1 } { #2 } { #3 } }
\cs_new:Npn \__nju_date_en:www #1-#2-#3 \q_stop
  { \clist_item:Nn \c__nju_month_en_clist { #2 } ~#3 , ~#1  }
\msg_new:nnn { njuthesis } { missing-title }
  {
    The~ title~ should~ not~ be~ left~ blank.\\
    Please~ check~ whether~ you~ have~ fill~ in~
    both~ Chinese~ and~ English~ titles.
  }
\cs_new_protected:Npn \__nju_split_title:n #1
  {
    \tl_if_in:nnTF { #1 } { \\ }
      {
        \seq_set_split:Nnn \l__nju_tmp_seq { \\ } { #1 }
        \clist_set_from_seq:NN \l__nju_tmp_clist \l__nju_tmp_seq
      }
      {
        \__nju_put_inempty_seg:nnn { #1 } { 1  } { 15 }
        \__nju_put_inempty_seg:nnn { #1 } { 16 } { 15 }
        \__nju_put_inempty_seg:nnn { #1 } { 31 } { 15 }
      }
  }
\cs_generate_variant:Nn \__nju_split_title:n { V }
\cs_new_protected:Npn \__nju_multiline_title:nnn #1#2#3
  {
    \tl_if_empty:NT \l__nju_info_title_tl
      { \msg_error:nn { njuthesis } { missing-title } }
    \__nju_split_title:V \l__nju_info_title_tl
    \__nju_spread_box:nnV { #2 } { \kaishu } \c__nju_name_title_tl
    \__nju_hskip:
    \clist_map_inline:Nn \l__nju_tmp_clist
      { \__nju_ulined_center_box:nn { #3 } { #1 ##1 } \__nju_vskip: }
  }
\cs_new_protected:Npn \__nju_cover_entry:nnn #1#2#3
  {
    \__nju_spread_box:nnx { #2 } { \kaishu } { \__nju_name:n { #1 } }
    \__nju_hskip:
    \__nju_ulined_center_box:nn { #3 }       { \__nju_info:n { #1 } }
    \__nju_vskip:
  }
\cs_new_protected:Npn \__nju_cover_bientry:nnnn #1#2#3#4
  {
    \__nju_spread_box:nnx { #3 } { \kaishu } { \__nju_name:n { #1 } }
    \__nju_hskip:
    \__nju_ulined_center_box:nn { #4 }       { \__nju_info:n { #1 } }
    \skip_horizontal:n { 0.5 em }
    \__nju_spread_box:nnx { #3 } { \kaishu } { \__nju_name:n { #2 } }
    \__nju_hskip:
    \__nju_ulined_center_box:nn { #4 }       { \__nju_info:n { #2 } }
    \__nju_vskip:
  }
\cs_new_protected:Npn \__nju_cover_supv_entry:nnn #1#2#3
  {
    \__nju_spread_box:nnx { #2 } { \kaishu } { \__nju_name:n { #1 } }
    \__nju_hskip:
    \__nju_ulined_center_box:nn { #3 }
      { \clist_item:cn { l__nju_info_ #1 _clist } { 1 } }
    \skip_horizontal:n { 0.5 em }
    \__nju_spread_box:nnV { #2 } { \kaishu } \c__nju_name_supv_ttl_tl
    \__nju_hskip:
    \__nju_ulined_center_box:nn { #3 }
      { \clist_item:cn { l__nju_info_ #1 _clist } { 2 } }
    \__nju_vskip:
  }
\cs_new_protected:Npn \__nju_abs_bookmark:nn #1#2
  {
    \phantomsection
    \bool_if:NTF \g__nju_abs_in_toc_bool
      { \__nju_add_tocline:n { #1 } }
      { \pdfbookmark [0] { #1 } { #2 } }
    \__nju_chapter_header:n { #1 }
  }
\cs_generate_variant:Nn \__nju_abs_bookmark:nn { Vn }
\cs_new_protected:Npn \__nju_abs_title:n #1
  {
    \__nju_get_text_width:Nn \l__nju_tmp_dim {#1}
    \__nju_uuline:n { \l__nju_tmp_dim } #1
  }
\cs_generate_variant:Nn \__nju_abs_title:n { V }
\cs_new_protected:Npn \__nju_uline_box:
  { \vtop{\box1\kern-\prevdepth\kern0.5ex\hrule} }
\msg_new:nnn { njuthesis } { abs-title-too-long }
  {
    Your~ title~ is~ too~ long~ to~ fit~ in~ two~ lines.\\
    I~ have~ drawn~ additional~ lines~ to~ contain~ it,~
    which~ will~ probably~ make~ your~ abstract~ page~
    look~ slightly~ different~ from~ the~ standard.\\
    You~ can~ use~ the~ "style/abstract-title"~ key~
    to~ disable~ this~ message.
  }
\cs_new_protected:Npn \__nju_uline_list:nnn #1#2#3
  {
    \hbox_set:Nn \l__nju_tmp_box {#1}
    \setbox0=\vbox{\hangindent=\wd\l__nju_tmp_box \hangafter=-1
        \leftskip=#3 \rightskip=\leftskip \parindent=\z@ #2\par
        \global\setbox2=\hbox{}
        \int_gzero:N \l__nju_tmp_int
        \loop
          \setbox1=\lastbox \unskip\unpenalty
        \unless\ifvoid1
          \global\setbox2=\hbox{\__nju_uline_box:\penalty0\unhbox2}
          \int_gincr:N \l__nju_tmp_int
        \repeat
      }
      {
        \noindent\copy\l__nju_tmp_box\unhbox2
        \bool_if:NT \g__nju_strict_abs_title_bool
          {
            \int_case:nnF { \l__nju_tmp_int }
              {
                { 0 } { \msg_error:nn { njuthesis } { missing-title } }
                { 1 } { \__nju_uline:n { \textwidth } }
                { 2 } { \prg_do_nothing: }
              }
              { \msg_warning:nn { njuthesis } { abs-title-too-long } }
            \par
          }
      }
  }
\cs_generate_variant:Nn \__nju_uline_list:nnn { xnn }
\DeclareObjectType { nju } { \c_zero_int }
\DeclareTemplateInterface { nju } { element } { \c_zero_int }
  {
    content     : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    bottom-skip : skip      = \c_zero_skip,
    align       : choice { l, r, c, n } = c
  }
\DeclareTemplateCode { nju } { element } { \c_zero_int }
  {
    content     = \l__njuelem_content_tl,
    format      = \l__njuelem_format_tl,
    bottom-skip = \l__njuelem_bottom_skip,
    align =
      {
        l =
          { \tl_set_eq:NN \l__njuelem_begin_align_tl \flushleft
            \tl_set_eq:NN \l__njuelem_end_align_tl   \endflushleft  },
        r =
          { \tl_set_eq:NN \l__njuelem_begin_align_tl \flushright
            \tl_set_eq:NN \l__njuelem_end_align_tl   \endflushright },
        c =
          { \tl_set_eq:NN \l__njuelem_begin_align_tl \center
            \tl_set_eq:NN \l__njuelem_end_align_tl   \endcenter     },
        n =
          { \tl_clear:N   \l__njuelem_begin_align_tl
            \tl_clear:N   \l__njuelem_end_align_tl                  }
      }
  }
  {
    \AssignTemplateKeys
    \group_begin:
      \l__njuelem_begin_align_tl
      \l__njuelem_format_tl
      \l__njuelem_content_tl \par
      \l__njuelem_end_align_tl
    \group_end:
    \__nju_vskip:N \l__njuelem_bottom_skip
  }
\DeclareTemplateInterface { nju } { page } { \c_zero_int }
  {
    element     : commalist = \c_empty_clist,
    prefix      : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    top-skip    : skip      = \c_zero_skip,
    bottom-skip : skip      = \c_zero_skip
  }
\DeclareTemplateCode { nju } { page } { \c_zero_int }
  {
    element     = \l__njupage_element_clist,
    prefix      = \l__njupage_prefix_tl,
    format      = \l__njupage_format_tl,
    top-skip    = \l__njupage_top_skip,
    bottom-skip = \l__njupage_bottom_skip
  }
  {
    \AssignTemplateKeys
    \newpage
    \__nju_vskip:N \l__njupage_top_skip
    \group_begin:
      \l__njupage_format_tl
      \clist_map_inline:Nn \l__njupage_element_clist
        { \UseInstance { nju } { \l__njupage_prefix_tl ##1 } }
    \group_end:
    \__nju_vskip:N \l__njupage_bottom_skip
  }
\cs_new_protected:Npn \__nju_declare_element:nn #1#2
  { \DeclareInstance { nju } {#1} { element } {#2} }
\cs_new_protected:Npn \__nju_declare_page:nn    #1#2
  { \DeclareInstance { nju } {#1} { page    } {#2} }
\keys_define:nn { nju }
  {
    degree            .choices:nn = { ug, mg, mf, phd }
      { \int_gset_eq:NN \g__nju_info_degree_int \l_keys_choice_int },
    degree            .initial:n  = ug,
    type              .choices:nn = { thesis, design }
      { \int_gset_eq:NN \g__nju_info_type_int   \l_keys_choice_int },
    type              .initial:n    = thesis,
    nlcover          .bool_set:N  = \g__nju_nlcover_bool,
    nlcover           .initial:n  = false,
    decl-page        .bool_set:N  = \g__nju_orig_decl_bool,
    decl-page         .initial:n  = false,
    draft           .bool_gset:N  = \g__nju_draft_bool,
    draft             .initial:n  = false,
    oneside   .value_forbidden:n  = true,
    twoside   .value_forbidden:n  = true,
    oneside .bool_gset_inverse:N  = \g__nju_twoside_bool,
    latin-font        .choices:nn =
      { gyre, mac, win, none }
      { \tl_set_eq:NN \g__nju_latin_font_tl \l_keys_choice_tl },
    cjk-font          .choices:nn =
      { fandol, founder, mac, noto, source, win, none }
      { \tl_set_eq:NN \g__nju_cjk_font_tl   \l_keys_choice_tl },
    config             .tl_set:N  = \g__nju_config_clist
  }
\ProcessKeysOptions { nju }
\keys_define:nn { nju }
  {
    bib   .meta:nn = { nju / bib   } { #1 },
    info  .meta:nn = { nju / info  } { #1 },
    style .meta:nn = { nju / style } { #1 }
  }
\NewDocumentCommand \njusetup { m } { \keys_set:nn { nju } { #1 } }
\PassOptionsToClass
  {
    a4paper,
    UTF8,
    scheme = chinese,
    \bool_if:NTF \g__nju_twoside_bool { twoside, } { oneside, }
    \bool_if:NT \g__nju_draft_bool { draft, }
    linespread = 1.625,
    fontset = none,
    zihao = -4
  }
  { ctexbook }
\clist_map_inline:nn
  {
    { no-math           } { fontspec     },
    { perpage           } { footmisc     },
    { amsmath, thmmarks } { ntheorem     },
    { hyphens           } { url          },
    { warnings-off={ mathtools-colon, mathtools-overbracket } }
                          { unicode-math },
    { capitalise, nameinlink, noabbrev }
                          { cleveref     }
  }
  { \PassOptionsToPackage #1 }
\LoadClass { ctexbook } [ 2018/04/01 ]
\RequirePackage
  {
    geometry,
    fancyhdr,
    setspace,
    mathtools,
    unicode-math,
    ntheorem,
    booktabs,
    caption,
    graphicx,
    enumitem,
    hyperref,
    cleveref
  }
\bool_if:NT \g__nju_twoside_bool { \RequirePackage{ emptypage } }
\sys_if_engine_xetex:T
  {
    \RequirePackage{xeCJKfntef}
    \NewDocumentCommand \njuline { m } { \CJKunderline{#1} }
  }
\sys_if_engine_luatex:T
  {
    \RequirePackage{lua-ul}
    \NewDocumentCommand \njuline { m } { \underLine{#1} \null }
  }
\msg_new:nnn { njuthesis } { package-too-old }
  {
    Package~ "#1"~ is~ too~ old.\\
    The~ njuthesis~ class~ only~ supports~ "#1"~ with~
    a~ version higher~ than~ v#2.\\
    Please~ update~ an~ up-to-date~ version~ of~ it~
    using~ your TeX~ package~ manager~ or~ from~ CTAN.
  }
\cs_new_protected:Npn \__nju_check_package:nnn #1#2#3
  {
    \@ifpackagelater {#1} {#2}
      { } { \msg_error:nnnn { njuthesis } { package-too-old } {#1} {#3} }
  }
\sys_if_engine_luatex:T
  { \__nju_check_package:nnn { luatexja } { 2021/10/24 } { 20211024.0 } }
\int_compare:nTF { \g__nju_info_degree_int == 1 }
  { \file_input:n { njuthesis-undergraduate.def } }
  { \file_input:n { njuthesis-     graduate.def } }
\msg_new:nnn { njuthesis } { load-config }
  { I~ am~ loading~ config~ file~ "#1". }
\clist_map_inline:Nn \g__nju_config_clist
  {
    \msg_info:nnn { njuthesis } { load-config } { #1 }
    \file_input:n { #1 }
  }
\keys_define:nn { nju / info }
  {
    title               .tl_set:N = \l__nju_info_title_tl,
    title              .initial:n = { 空 },
    title*              .tl_set:N = \l__nju_info_title_en_tl,
    title*             .initial:n = { Empty },
    keywords         .clist_set:N = \l__nju_info_keywords_clist,
    keywords*        .clist_set:N = \l__nju_info_keywords_en_clist,
    grade               .tl_set:N = \l__nju_info_grade_tl,
    student-id          .tl_set:N = \l__nju_info_id_tl,
    author              .tl_set:N = \l__nju_info_author_tl,
    author*             .tl_set:N = \l__nju_info_author_en_tl,
    department          .tl_set:N = \l__nju_info_dept_tl,
    department*         .tl_set:N = \l__nju_info_dept_en_tl,
    major               .tl_set:N = \l__nju_info_major_tl,
    major*              .tl_set:N = \l__nju_info_major_en_tl,
    field               .tl_set:N = \l__nju_info_field_tl,
    field*              .tl_set:N = \l__nju_info_field_en_tl,
    supervisor       .clist_set:N = \l__nju_info_supv_clist,
    supervisor*         .tl_set:N = \l__nju_info_supv_en_tl,
    supervisor-ii    .clist_set:N = \l__nju_info_supv_ii_clist,
    supervisor-ii*      .tl_set:N = \l__nju_info_supv_ii_en_tl,
    submit-date         .tl_set:N = \l__nju_info_sm_date_raw_tl,
    submit-date        .initial:V = \c__nju_today_tl,
    defend-date         .tl_set:N = \l__nju_info_df_date_raw_tl,
    defend-date        .initial:V = \c__nju_today_tl,
    chairman            .tl_set:N = \l__nju_info_chairman_tl,
    reviewer         .clist_set:N = \l__nju_info_reviewer_clist,
    clc                 .tl_set:N = \l__nju_info_clc_tl,
    secret-level        .tl_set:N = \l__nju_info_seclv_tl,
    udc                 .tl_set:N = \l__nju_info_udc_tl,
    supervisor-contact  .tl_set:N = \l__nju_info_supv_cont_tl,
  }
\tl_set:Nx \l__nju_info_degree_tl
  {
    \clist_item:Nn \c__nju_name_degree_clist
      { \g__nju_info_degree_int }
  }
\int_compare:nTF { \g__nju_info_degree_int == 1 }
  { \tl_set:Nn \l__nju_info_diploma_tl { ug } }
  { \tl_set:Nn \l__nju_info_diploma_tl { g  } }
\tl_set:Nx \l__nju_info_type_tl
  { \clist_item:Nn \c__nju_name_type_clist    { \g__nju_info_type_int } }
\tl_set:Nx \l__nju_info_type_en_tl
  { \clist_item:Nn \c__nju_name_type_en_clist { \g__nju_info_type_int } }
\tl_put_left:Nx \l__nju_info_type_tl
  { \tl_use:c { c__nju_name_ \l__nju_info_diploma_tl _tl } }
\ctex_at_end_preamble:n
  {
    \bool_set:Nn \l__nju_second_supv_bool
      { ! \clist_if_empty_p:N \l__nju_info_supv_ii_clist }
    \tl_set:Nx \l__nju_info_supv_full_tl
      {
        \clist_use:Nn \l__nju_info_supv_clist { \__nju_hskip: }
        \bool_if:NT \l__nju_second_supv_bool
          {
            \__nju_quad:
            \clist_use:Nn \l__nju_info_supv_ii_clist { \__nju_hskip: }
          }
      }
    \tl_set:Nx \l__nju_info_supv_full_en_tl
      {
        \l__nju_info_supv_en_tl
        \bool_if:NT \l__nju_second_supv_bool
          { \__nju_quad: \l__nju_info_supv_ii_en_tl }
      }
    \tl_set:Nn \l__nju_info_sm_date_tl
      {
        \exp_last_unbraced:NV
          \__nju_date:www \l__nju_info_sm_date_raw_tl \q_stop
      }
    \int_compare:nF { \g__nju_info_degree_int == 1 }
      {
        \tl_set:Nn \l__nju_info_sm_date_en_tl
          {
            \exp_last_unbraced:NV
              \__nju_date_en:www \l__nju_info_sm_date_raw_tl \q_stop
          }
        \tl_set:Nn \l__nju_info_df_date_tl
          {
            \exp_last_unbraced:NV
              \__nju_date:www \l__nju_info_df_date_raw_tl \q_stop
          }
      }
  }
\bool_lazy_or:nnT
  { \tl_if_empty_p:N \g__nju_latin_font_tl }
  { \tl_if_empty_p:N \g__nju_cjk_font_tl   }
  {
    \sys_if_platform_windows:TF
      {
        \tl_set:Nn \g__nju_latin_font_tl     { win    }
        \tl_set:Nn \g__nju_cjk_font_tl       { win    }
      }
      {
        \ctex_if_platform_macos:TF
          {
            \tl_set:Nn \g__nju_latin_font_tl { mac    }
            \tl_set:Nn \g__nju_cjk_font_tl   { mac    }
          }
          {
            \tl_set:Nn \g__nju_latin_font_tl { gyre   }
            \tl_set:Nn \g__nju_cjk_font_tl   { fandol }
          }
      }
  }
\cs_new_protected:Npn \__nju_load_latin_font_win:
  {
    \setmainfont { Times~New~Roman }
    \setsansfont { Arial           }
    \setmonofont { Courier~New     }
      [ Scale = MatchLowercase ]
  }
\cs_new_protected:Npn \__nju_load_latin_font_mac:
  {
    \setmainfont { Times~New~Roman }
    \setsansfont { Arial           }
    \setmonofont { Menlo           }
      [ Scale = MatchLowercase ]
  }
\cs_new_protected:Npn \__nju_load_latin_font_gyre:
  {
    \setmainfont { texgyretermes }
      [
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      ]
    \setsansfont { texgyreheros  }
      [
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      ]
    \setmonofont { texgyrecursor }
      [
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic,
        Scale          = MatchLowercase,
        Ligatures      = CommonOff
      ]
  }
\cs_new_protected:Npn \__nju_hide_no_script_msg:
  { \msg_redirect_name:nnn { fontspec } { no-script } { info } }
\cs_new_protected:Npn \__nju_load_cjk_font_win:
  {
    \setCJKmainfont { SimSun   }
      [ AutoFakeBold = 2.17, ItalicFont = KaiTi ]
    \setCJKsansfont { SimHei   } [ AutoFakeBold = 2.17 ]
    \setCJKmonofont { FangSong } [ AutoFakeBold = 2.17 ]
    \setCJKfamilyfont { zhsong } { SimSun   } [ AutoFakeBold = 2.17 ]
    \setCJKfamilyfont { zhhei  } { SimHei   } [ AutoFakeBold = 2.17 ]
    \setCJKfamilyfont { zhfs   } { FangSong } [ AutoFakeBold = 2.17 ]
    \setCJKfamilyfont { zhkai  } { KaiTi    } [ AutoFakeBold = 2.17 ]
  }
\cs_new_protected:Npn \__nju_load_cjk_font_mac:
  {
    \__nju_hide_no_script_msg:
    \setCJKmainfont{Songti~SC~Light}[
      BoldFont=Songti~SC~Bold,
      ItalicFont=Kaiti~SC,
      BoldItalicFont=Kaiti~SC~Bold]
    \setCJKsansfont{Heiti~SC~Light}[BoldFont=Heiti~SC~Medium]
    \setCJKmonofont{STFangsong}
    \setCJKfamilyfont{zhsong}{Songti~SC~Light}[BoldFont=Songti~SC~Bold]
    \setCJKfamilyfont{zhhei}{Heiti~SC~Light}[BoldFont=Heiti~SC~Medium]
    \setCJKfamilyfont{zhfs}{STFangsong}
    \setCJKfamilyfont{zhkai}{Kaiti~SC}[BoldFont=Kaiti~SC~Bold]
    \setCJKfamilyfont{zhnewhei}{PingFang~SC}
  }
\cs_new_protected:Npn \__nju_load_cjk_font_fandol:
  {
    \__nju_hide_no_script_msg:
    \setCJKmainfont { FandolSong-Regular }
      [
        Extension    = .otf,
        BoldFont     = FandolSong-Bold,
        ItalicFont   = FandolKai-Regular
      ]
    \setCJKsansfont { FandolHei-Regular  }
      [
        Extension    = .otf,
        BoldFont     = FandolHei-Bold
      ]
    \setCJKmonofont { FandolFang-Regular }
      [ Extension    = .otf ]
    \setCJKfamilyfont { zhsong } { FandolSong-Regular }
      [
        Extension    = .otf,
        BoldFont     = FandolSong-Bold
      ]
    \setCJKfamilyfont { zhhei  } { FandolHei-Regular  }
      [
        Extension    = .otf,
        BoldFont     = FandolHei-Bold
      ]
    \setCJKfamilyfont { zhfs   } { FandolFang-Regular }
      [ Extension    = .otf ]
    \setCJKfamilyfont { zhkai  } { FandolKai-Regular  }
      [
        Extension    = .otf,
        AutoFakeBold = 2.17
      ]
  }
\cs_new_protected:Npn \__nju_load_cjk_font_founder:
  {
    \sys_if_engine_xetex:T
      { \xeCJKEditPunctStyle {quanjiao} { optimize-kerning = true } }
    \sys_if_engine_luatex:T
      { \defaultCJKfontfeatures { JFM = { zh_CN/{quanjiao,fzpr} } } }
    \setCJKmainfont { FZShuSong-Z01  }
      [ BoldFont = FZXiaoBiaoSong-B05, ItalicFont = FZKai-Z03 ]
    \setCJKsansfont { FZXiHeiI-Z08   } [ BoldFont = FZHei-B01 ]
    \setCJKmonofont { FZFangSong-Z02 }
    \setCJKfamilyfont { zhsong } { FZShuSong-Z01  }
      [ BoldFont = FZXiaoBiaoSong-B05 ]
    \setCJKfamilyfont { zhhei  } { FZHei-B01      }
      [ AutoFakeBold = 2.17 ]
    \setCJKfamilyfont { zhkai  } { FZKai-Z03      }
      [ AutoFakeBold = 2.17 ]
    \setCJKfamilyfont { zhfs   } { FZFangSong-Z02 }
    \defaultCJKfontfeatures{}
  }
\cs_new_protected:Npn \__nju_load_cjk_font_noto:
  {
    \setCJKmainfont
      [
        UprightFont        = NotoSerifCJKsc-Regular,
        BoldFont           = NotoSerifCJKsc-Bold,
        ItalicFont         = NotoSerifCJKsc-Regular,
        BoldItalicFont     = NotoSerifCJKsc-Bold,
        ItalicFeatures     = FakeSlant,
        BoldItalicFeatures = FakeSlant
      ] { Noto~Serif~CJK~SC     }
    \setCJKsansfont
      [
        UprightFont        = NotoSansCJKsc-Regular,
        BoldFont           = NotoSansCJKsc-Bold,
        ItalicFont         = NotoSansCJKsc-Regular,
        BoldItalicFont     = NotoSansCJKsc-Bold,
        ItalicFeatures     = FakeSlant,
        BoldItalicFeatures = FakeSlant
      ] { Noto~Sans~CJK~SC      }
    \setCJKmonofont { Noto~Sans~Mono~CJK~SC }
    \setCJKfamilyfont { zhsong } { Noto~Serif~CJK~SC }
    \setCJKfamilyfont { zhhei  } { Noto~Sans~CJK~SC  }
    \setCJKfamilyfont { zhfs   } { FZFangSong-Z02    }
    \setCJKfamilyfont { zhkai  } { FZKai-Z03         }
      [AutoFakeBold=2.17]
  }
\cs_new_protected:Npn \__nju_load_cjk_font_source:
  {
    \setCJKmainfont
      [
        UprightFont        = SourceHanSerifSC-Regular,
        BoldFont           = SourceHanSerifSC-Bold,
        ItalicFont         = SourceHanSerifSC-Regular,
        BoldItalicFont     = SourceHanSerifSC-Bold,
        ItalicFeatures     = FakeSlant,
        BoldItalicFeatures = FakeSlant
      ] { Source~Han~Serif~SC     }
    \setCJKsansfont
      [
        UprightFont        = SourceHanSansSC-Regular,
        BoldFont           = SourceHanSansSC-Bold,
        ItalicFont         = SourceHanSansSC-Regular,
        BoldItalicFont     = SourceHanSansSC-Bold,
        ItalicFeatures     = FakeSlant,
        BoldItalicFeatures = FakeSlant
      ] { Source~Han~Sans~SC      }
    \setCJKmonofont { FZFangSong-Z02      }
    \setCJKfamilyfont { zhsong } { Source~Han~Serif~SC }
    \setCJKfamilyfont { zhhei  } { Source~Han~Sans~SC  }
    \setCJKfamilyfont { zhfs   } { FZFangSong-Z02      }
    \setCJKfamilyfont { zhkai  } { FZKai-Z03           }
      [AutoFakeBold=2.17]
  }
\cs_new_protected:Npn \__nju_load_math_font:
  {
    % \setmathfont{STIXTwoMath-Regular}[Extension = .otf]
    \setmathfont{XITSMath-Regular}[
      BoldFont = XITSMath-Bold,
      Extension = .otf]
    \setmathfont{NewCMMath-Regular.otf}[range={cal,bb,frak}]
    \setmathfont{NewCMMath-Regular.otf}[version=bold,range={bfcal}]
  }
\cs_new_protected:Npn \__nju_load_font:
  {
    \use:c { __nju_load_latin_font_ \g__nju_latin_font_tl : }
    \use:c { __nju_load_cjk_font_   \g__nju_cjk_font_tl   : }
    \__nju_load_math_font:
    \NewDocumentCommand \songti   { } { \CJKfamily { zhsong } }
    \NewDocumentCommand \heiti    { } { \CJKfamily { zhhei  } }
    \NewDocumentCommand \fangsong { } { \CJKfamily { zhfs   } }
    \NewDocumentCommand \kaishu   { } { \CJKfamily { zhkai  } }
    \RenewDocumentCommand \large  { } { \zihao     { 4      } }
  }
\__nju_load_font:
\geometry
  {
    vmargin    = 2.5 cm,
    hmargin    = 3.2 cm,
    headheight = 15 pt
  }
\bool_if:NT \g__nju_draft_bool { \geometry { showframe } }
\keys_define:nn { nju / style }
  {
    header/format .tl_gset:N = \g__nju_header_format_tl,
    header/format .initial:n = \small \kaishu,
    header     .clist_gset:N = \g__nju_header_twoside_clist,
    header*    .clist_gset:N = \g__nju_header_oneside_clist,
    header        .initial:n =
      {
        { EL } { \leftmark  }, { OR } { \rightmark }
      },
    header*       .initial:n =
      {
        {  L } { \leftmark  }, {  R } { \rightmark }
      },
    footer/format .tl_gset:N = \g__nju_footer_format_tl,
    footer/format .initial:n = \small \rmfamily,
    footer     .clist_gset:N = \g__nju_footer_twoside_clist,
    footer*    .clist_gset:N = \g__nju_footer_oneside_clist,
    footer        .initial:n = { { C } { \thepage } },
    footer*       .initial:n = { { C } { \thepage } }
  }
\clist_new:N \g__nju_header_clist
\clist_new:N \g__nju_footer_clist
\ctex_at_end_preamble:n
  {
    \bool_if:NTF \g__nju_twoside_bool
      {
        \clist_set_eq:NN \g__nju_header_clist \g__nju_header_twoside_clist
        \clist_set_eq:NN \g__nju_footer_clist \g__nju_footer_twoside_clist
      }
      {
        \clist_set_eq:NN \g__nju_header_clist \g__nju_header_oneside_clist
        \clist_set_eq:NN \g__nju_footer_clist \g__nju_footer_oneside_clist
      }
  }
\cs_new_protected:Npn \__nju_header:nn #1#2
  { \fancyhead [#1] { \g__nju_header_format_tl #2 } }
\cs_new_protected:Npn \__nju_footer:nn #1#2
  { \fancyfoot [#1] { \g__nju_footer_format_tl #2 } }
\fancypagestyle { plain }
  {
    \fancyhf { }
    \clist_map_inline:Nn \g__nju_footer_clist { \__nju_footer:nn ##1 }
    \tl_set:Nn \headrulewidth { \c_zero_dim }
    \tl_set:Nn \footrulewidth { \c_zero_dim }
  }
\fancypagestyle { headings }
  {
    \fancyhf { }
    \clist_if_empty:NTF \g__nju_header_clist
      {
        \tl_set:Nn \headrulewidth { \c_zero_dim }
      }
      {
        \tl_set:Nn \headrulewidth { 0.4 pt }
        \dim_set:Nn \headheight { 20 pt }
        \clist_map_inline:Nn \g__nju_header_clist
          { \__nju_header:nn ##1 }
      }
    \clist_map_inline:Nn \g__nju_footer_clist { \__nju_footer:nn ##1 }
    \tl_set:Nn \footrulewidth { \c_zero_dim }
  }
\RenewDocumentCommand \frontmatter { }
  {
    \cleardoublepage
    \exp_args:NV \pagestyle \c__nju_pagestyle_tl
    \pagenumbering { Roman }
  }
\RenewDocumentCommand \mainmatter { }
  {
    \cleardoublepage
    \exp_args:NV \pagestyle \c__nju_pagestyle_tl
    \pagenumbering { arabic }
    \normalfont \normalsize
  }
\AtBeginEnvironment { document }
  {
    \exp_args:NV \pagestyle \c__nju_pagestyle_tl
    \pagenumbering { Roman }
  }
\tl_const:Nn \c__nju_sec_format_tl { \large \normalfont \sffamily }
\cs_new_protected:Npn \__nju_add_tocline:n #1
  { \addcontentsline { toc } { chapter } { \c__nju_sec_format_tl #1 } }
\cs_generate_variant:Nn \__nju_add_tocline:n { V }
\cs_new_protected:Npn \__nju_chapter:n #1
  {
    \chapter *           { #1 }
    \__nju_add_tocline:n    { #1 }
    \__nju_chapter_header:n { #1 }
  }
\cs_generate_variant:Nn \__nju_chapter:n { V }
\cs_new_protected:Npn \__nju_chapter_header:n #1
  {
    \bool_if:NTF \g__nju_twoside_bool
      { \markboth { #1 } { #1 } }
      { \markboth { \hfill #1 \hfill } { } }
  }
\NewDocumentCommand \njuchapter { m } { \__nju_chapter:n { #1 } }
\keys_set:nn { ctex }
  {
    chapter        / beforeskip = 10 pt,
    chapter        / afterskip  = 60 pt,
    chapter        / format     = \c__nju_sec_format_tl \centering,
    section        / format     = \c__nju_sec_format_tl,
    subsection     / format     = \c__nju_sec_format_tl,
    subsubsection  / format     = \c__nju_sec_format_tl,
    contentsname   = { 目\hspace{2em}录 },
    listfigurename = { 插图目录         },
    listtablename  = { 表格目录         },
    chapter / tocline = \c__nju_sec_format_tl \CTEXnumberline { #1 } #2
  }
\keys_define:nn { nju / style }
  {
    toc-in-toc .bool_gset:N = \g__nju_toc_in_toc_bool,
    toc-in-toc   .initial:n = true
  }
\cs_new_protected:Npn \__nju_make_toc:nn #1#2
  {
    \group_begin:
      \keys_set:nn { ctex }
        { chapter/format = \centering \zihao { 3 } \bfseries }
      \bool_if:NTF \g__nju_toc_in_toc_bool
        { \__nju_chapter:n { #1 } }
        {
          \chapter * { #1 }
          \pdfbookmark [0] { #1 } { #2 }
          \__nju_chapter_header:n { #1 }
        }
    \group_end:
    \@starttoc { #2 }
  }
\cs_generate_variant:Nn \__nju_make_toc:nn { Vn }
\RenewDocumentCommand \tableofcontents { }
  { \__nju_make_toc:Vn \contentsname   { toc } }
\RenewDocumentCommand \listoffigures   { }
  { \__nju_make_toc:Vn \listfigurename { lof } }
\RenewDocumentCommand \listoftables    { }
  { \__nju_make_toc:Vn \listtablename  { lot } }
\clist_new:N \g__nju_biblatex_option_clist
\clist_new:N \g__nju_bib_resource_clist
\msg_new:nnn { njuthesis } { extra-bib-style }
  {
    Wrongly-placed~ bib~ style.\\
    Please~ use~ the~ `bib/style`~ field.
  }
\keys_define:nn { nju / bib }
  {
    style             .choice:,
    style / numeric     .code:n =
      {
        \clist_gput_right:Nn \g__nju_biblatex_option_clist
          { style = gb7714-2015      }
      },
    style / author-year .code:n =
      {
        \clist_gput_right:Nn \g__nju_biblatex_option_clist
          { style = gb7714-2015ay    }
      },
    style / unknown     .code:n =
      {
        \clist_gput_right:Nx \g__nju_biblatex_option_clist
          { style = \l_keys_value_tl }
      },
    style            .initial:n = numeric,
    option              .code:n =
      {
        \tl_if_in:VnTF \l_keys_value_tl { style = }
          { \msg_error:nn { njuthesis } { extra-bib-style } }
          {
            \clist_gput_right:NV \g__nju_biblatex_option_clist
              \l_keys_value_tl
          }
      },
    resource            .code:n =
      {
        \clist_gput_right:NV \g__nju_bib_resource_clist
          \l_keys_value_tl
      },
  }
\NewDocumentCommand \addbibresource { m }
  { \clist_gput_right:Nn \g__nju_bib_resource_clist { #1 } }
\cs_new_protected:Npn \__nju_biblatex_pre_setup:
  {
    \cs_undefine:N \addbibresource
    \clist_gput_right:Nn \g__nju_biblatex_option_clist { backend = biber }
    \exp_args:NV \PassOptionsToPackage
      \g__nju_biblatex_option_clist { biblatex }
  }
\cs_new_protected:Npn \__nju_biblatex_post_setup:
  {
    \defbibheading { njubibintoc } [ \bibname ] { \__nju_chapter:n { ##1 } }
    \tl_if_eq:NnTF \blx@refsecreset@level { 2 }
      { \DeclarePrintbibliographyDefaults { heading = subbibintoc } }
      { \DeclarePrintbibliographyDefaults { heading = njubibintoc } }
    \clist_map_inline:Nn \g__nju_bib_resource_clist
      { \addbibresource { ##1 } }
  }
\BeforeBeginEnvironment { document }
  {
    \__nju_biblatex_pre_setup:
    \RequirePackage { biblatex }
    \__nju_biblatex_post_setup:
  }
\ctex_at_end_preamble:n
  {
    \pdfstringdefDisableCommands
      { \cs_set_eq:NN \\ \prg_do_nothing: }
    \hypersetup
      {
        bookmarksnumbered = true,
        psdextra          = true,
        unicode           = true,
        hidelinks,
        pdftitle    = \l__nju_info_title_tl,
        pdfauthor   = \l__nju_info_author_tl,
        pdfkeywords = \l__nju_info_keywords_clist,
        pdfcreator  = \c__nju_name_pdf_creator_tl
      }
  }
\cs_new_protected:Npn \__nju_cref_name:n #1
  {
    \clist_map_inline:nn { #1 }
      {
        \crefname { ##1 }
          { \__nju_name:n { ##1 } } { \__nju_name:n { ##1 _en } }
      }
  }
\cs_generate_variant:Nn \__nju_cref_name:n { V }
\crefdefaultlabelformat { #2#1#3\, }
\crefformat { equation      } { 公式~#2#1#3~   }
\crefformat { chapter       } { 第#2#1#3章     }
\crefformat { section       } { 第~#2#1#3~节   }
\crefformat { subsection    } { 第~#2#1#3~小节 }
\crefformat { subsubsection } { 第~#2#1#3~小节 }
\__nju_cref_name:n { figure, table, appendix, proof }
\__nju_cref_name:V \g__nju_theorem_type_clist
\DeclareGraphicsExtensions { .pdf, .eps, .jpg, .png }
\BeforeBeginEnvironment { tabular } { \centering \zihao {5} }
\DeclareCaptionStyle{njucap}
  {
    font          = small,
    labelfont     = bf,
    labelsep      = quad,
    justification = centering
  }
\captionsetup [ figure ] { style = njucap }
\captionsetup [ table  ] { style = njucap }
\setlist { noitemsep }
\cs_new_protected:Npn \__nju_new_theorem:N #1
  {
    \theoremsymbol { }
    \clist_map_inline:Nn #1
      { \newtheorem { ##1 } { \__nju_name:n { ##1 } } }
  }
\theoremsymbol { \ensuremath { \mdwhtsquare } }
\newtheorem* { proof } { \c__nju_name_proof_tl }
\group_begin:
  \clist_remove_all:Nn \g__nju_theorem_type_clist { proof }
  \__nju_new_theorem:N \g__nju_theorem_type_clist
\group_end:
\cs_new_protected:Npn \__nju_new_img_cmd:nn #1#2
  {
    \exp_args:Nc \NewDocumentCommand { #1 } { o m m }
      { \includegraphics [ width = ##2, height = ##3 ] { #2 } }
  }
\cs_generate_variant:Nn \__nju_new_img_cmd:nn { nV }
\keys_define:nn { nju / style }
  {
    emblem-img .code:n =
      { \__nju_new_img_cmd:nV { njuemblem } \l_keys_value_tl },
    name-img   .code:n =
      { \__nju_new_img_cmd:nV { njuname   } \l_keys_value_tl }
  }
\msg_new:nnn { njuthesis } { missing-image }
  {
    Local~ images~ not~ designated.\\
    It~ seems~ that~ you~ haven't~ fill~ in~ both~
    "style/emblem-img"~ and~ "style/name-img",~
    therefore~ I~ am~ using~ package~ "njuvisual"~
    instead,~ which~ may~ slow~ down~ the~ compilation.
  }
\ctex_at_end_preamble:n
  {
    \bool_lazy_and:nnF
      { \cs_if_exist_p:N \njuemblem }
      { \cs_if_exist_p:N \njuname   }
      {
        \cs_undefine:N \njuemblem
        \cs_undefine:N \njuname
        \msg_warning:nn { njuthesis } { missing-image }
        \RequirePackage { njuvisual }
      }
  }
\RenewDocumentCommand \maketitle { }
  {
    \bool_if:NF \g__nju_draft_bool
      {
        \pagestyle     { empty  }
        \pagenumbering { gobble }
        \bool_if:NTF \g__nju_nlcover_bool
          { \__nju_make_cover_nl: }
          { \__nju_make_cover:    }
        \bool_if:NT \g__nju_orig_decl_bool { \__nju_make_orig_decl: }
      }
    \tl_remove_all:Nn \l__nju_info_title_tl { \\ }
    \cleardoublepage
    \exp_args:NV \pagestyle \c__nju_pagestyle_tl
    \pagenumbering { Roman }
  }
\__nju_declare_element:nn { abstract / mark }
  {
    content     = \c__nju_name_abstract_b_tl,
    format      = \sffamily \zihao { -3 },
    bottom-skip = 1 cm
  }
\__nju_declare_element:nn { abstract / en / mark }
  {
    content     = \c__nju_name_abstract_b_en_tl,
    format      = \sffamily \zihao { -3 },
    bottom-skip = 1 cm
  }
\cs_new_protected:Npn \__nju_print_keywords:nn #1#2
  {
    \tl_set:Nv \l__nju_tmp_tl { c__nju_name_keywords #1 _tl }
    \__nju_get_text_width:NV \l__nju_tmp_dim \l__nju_tmp_tl
    \list { \l__nju_tmp_tl }
      {
        \labelwidth  \l__nju_tmp_dim
        \labelsep    \c_zero_dim
        \leftmargin  \c_zero_dim
        \rightmargin \c_zero_dim
        \advance \leftmargin \l__nju_tmp_dim
        \cs_set_eq:NN \makelabel \textbf
      }
    \item \clist_use:cn { l__nju_info_keywords #1 _clist } { #2 }
    \endlist
  }
\skip_new:N \g__nju_abs_title_left_skip
\keys_define:nn { nju / style }
  {
    abstract-in-toc      .bool_gset:N = \g__nju_abs_in_toc_bool,
    abstract-in-toc        .initial:n = true,
    abstract-title          .choice:,
    abstract-title / strict   .code:n =
      {
        \bool_gset_true:N  \g__nju_strict_abs_title_bool
        \skip_gset:Nn \g__nju_abs_title_left_skip { 1 em }
      },
    abstract-title / centered .code:n =
      {
        \bool_gset_true:N \g__nju_strict_abs_title_bool
        \skip_gset:Nn \g__nju_abs_title_left_skip { 0 pt plus 1 fill }
      },
    abstract-title / natural  .code:n =
      {
        \bool_gset_false:N \g__nju_strict_abs_title_bool
        \skip_gset:Nn \g__nju_abs_title_left_skip { 0 pt plus 1 fill }
      },
    abstract-title        .initial:n = strict
  }
\NewDocumentEnvironment { abstract } { +b }
  {
    \cleardoublepage
    \thispagestyle { plain }
    \__nju_abs_bookmark:Vn \c__nju_name_abstract_a_tl { abstract }
    \__nju_make_abstract:
    \group_begin: \kaishu \zihao { -4 } #1
  }
  { \__nju_print_keywords:nn { } { ； } \group_end: }
\NewDocumentEnvironment { abstract* } { +b }
  {
    \cleardoublepage
    \thispagestyle { plain }
    \__nju_abs_bookmark:Vn \c__nju_name_abstract_a_en_tl { abstract-en }
    \__nju_make_abstract_en:
    \group_begin: \zihao { -4 } #1
  }
  { \__nju_print_keywords:nn { _en } { ;~ } \group_end: }
\NewDocumentEnvironment { preface         } { +b }
  { \__nju_chapter:V \c__nju_name_preface_tl         #1 } { }
\NewDocumentEnvironment { acknowledgement } { +b }
  { \__nju_chapter:V \c__nju_name_acknowledgement_tl #1 } { }
\NewDocumentCommand \njupaperlist
  { O { \c__nju_name_paperlist_tl } m }
  {
    \group_begin:
    \RenewDocumentCommand \mkbibnamegiven  { m }
      { \ifitemannotation { thesisauthor }
          { \njuline { \bf ##1 } } { ##1 } }
    \RenewDocumentCommand \mkbibnamefamily { m }
      { \ifitemannotation { thesisauthor }
          { \njuline { \bf ##1 } } { ##1 } }
    \RenewDocumentCommand \mkbibdateshort { m m m }
      { \textbf { \thefield { ##1 } } }
    \begin{refsection}
      \nocite { #2 }
      \printbibliography [ heading = subbibliography, title = #1 ]
    \end{refsection}
    \group_end:
  }
\cs_new_protected:Npn \__nju_notation_label:n #1 { #1 \hfil }
\cs_new_protected:Npn \__nju_make_notation:nn #1#2
  {
    \dim_set:Nn \l__nju_tmp_dim { \textwidth - #1 - #2 }
    \list { }
      {
        \labelwidth #2
        \labelsep   \c_zero_dim
        \itemsep    \c_zero_dim
        \parsep     \c_zero_dim
        \leftmargin  .5\l__nju_tmp_dim
        \rightmargin \leftmargin
        \advance \leftmargin #2
        \cs_set_eq:NN \makelabel \__nju_notation_label:n
      }
  }
\NewDocumentEnvironment { notation } { O { 10 em } O { 5 em } }
  {
    \__nju_chapter:V \c__nju_name_notation_tl
    \__nju_make_notation:nn { #1 } { #2 }
  }
  { \endlist }
\NewDocumentEnvironment { notation* } { O { 10 em } O { 5 em } }
  {
    \chapter * { \c__nju_name_notation_tl }
    \__nju_make_notation:nn { #1 } { #2 }
  }
  { \endlist }
\endinput
%%
%% End of file `njuthesis.cls'.
