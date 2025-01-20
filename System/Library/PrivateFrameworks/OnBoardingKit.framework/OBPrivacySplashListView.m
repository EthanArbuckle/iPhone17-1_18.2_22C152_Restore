@interface OBPrivacySplashListView
- (BOOL)displayingPrivacyPane;
- (BOOL)underlineLinks;
- (NSMutableArray)stackedIconTextLists;
- (NSMutableArray)textViews;
- (OBPrivacySplashListView)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4;
- (OBPrivacySplashListView)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4 displayingPrivacyPane:(BOOL)a5;
- (UITextView)footerTextView;
- (void)_updateTextViewsForLinkUITreatment:(id)a3;
- (void)setDisplayingPrivacyPane:(BOOL)a3;
- (void)setStackedIconTextLists:(id)a3;
- (void)setTextViews:(id)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFonts;
- (void)updateSpacing;
- (void)updateTextAlignment;
@end

@implementation OBPrivacySplashListView

- (OBPrivacySplashListView)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4
{
  return [(OBPrivacySplashListView *)self initWithContentList:a3 dataDetectorTypes:a4 displayingPrivacyPane:0];
}

- (OBPrivacySplashListView)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4 displayingPrivacyPane:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v66.receiver = self;
  v66.super_class = (Class)OBPrivacySplashListView;
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v57 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v58 = *MEMORY[0x1E4F1DB28];
  v11 = -[OBPrivacySplashListView initWithFrame:](&v66, sel_initWithFrame_);
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    textViews = v11->_textViews;
    v11->_textViews = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    stackedIconTextLists = v11->_stackedIconTextLists;
    v11->_stackedIconTextLists = (NSMutableArray *)v14;

    [(OBPrivacySplashListView *)v11 setDisplayingPrivacyPane:v5];
    [(OBPrivacySplashListView *)v11 setAxis:1];
    [(OBPrivacySplashListView *)v11 setBaselineRelativeArrangement:1];
    if ([v8 count])
    {
      uint64_t v16 = 0;
      double v17 = *MEMORY[0x1E4FB2848];
      double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      uint64_t v60 = *MEMORY[0x1E4FB0738];
      v55 = v11;
      id v56 = v8;
      unint64_t v54 = a4;
      while (1)
      {
        v21 = objc_msgSend(v8, "objectAtIndexedSubscript:", v16, v54);
        v22 = [v21 text];

        if (v22) {
          break;
        }
        v33 = [v21 bullets];

        if (v33)
        {
          uint64_t v59 = v16;
          v23 = -[OBStackedIconTextList initWithFrame:]([OBStackedIconTextList alloc], "initWithFrame:", v58, v57, v9, v10);
          [(OBStackedIconTextList *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
          -[OBStackedIconTextList setLayoutMargins:](v23, "setLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
          [(OBStackedIconTextList *)v23 setLayoutMarginsRelativeArrangement:1];
          [(OBStackedIconTextList *)v23 setDataDetectorTypes:a4];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          v61 = v21;
          v34 = [v21 bullets];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v67 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v63 != v37) {
                  objc_enumerationMutation(v34);
                }
                v39 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                v40 = [v39 icon];

                if (v40)
                {
                  v41 = [v39 icon];
                  v42 = [v39 icon];
                  [v42 size];
                  double v44 = v43;
                  double v46 = v45;
                }
                else
                {
                  v42 = +[OBImage systemImageNamed:@"circle.fill"];
                  v47 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
                  v41 = [v42 imageWithTintColor:v47 renderingMode:1];

                  double v46 = 6.0;
                  double v44 = 6.0;
                }

                v48 = [v39 text];
                -[OBStackedIconTextList addEntryWithIcon:iconSize:text:](v23, "addEntryWithIcon:iconSize:text:", v41, v48, v44, v46);
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v62 objects:v67 count:16];
            }
            while (v36);
          }

          v11 = v55;
          [(OBPrivacySplashListView *)v55 addArrangedSubview:v23];
          v26 = [(OBPrivacySplashListView *)v55 stackedIconTextLists];
          [v26 addObject:v23];
          id v8 = v56;
          a4 = v54;
          uint64_t v16 = v59;
          goto LABEL_18;
        }
LABEL_19:

        if (++v16 >= (unint64_t)[v8 count]) {
          goto LABEL_20;
        }
      }
      v23 = [MEMORY[0x1E4FB1DD8] textViewUsingTextLayoutManager:0];
      [(OBStackedIconTextList *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
      -[OBStackedIconTextList setTextContainerInset:](v23, "setTextContainerInset:", v17, v18, v19, v20);
      v24 = [(OBStackedIconTextList *)v23 textContainer];
      [v24 setLineFragmentPadding:0.0];

      [(OBStackedIconTextList *)v23 setEditable:0];
      [(OBStackedIconTextList *)v23 setSelectable:1];
      [(OBStackedIconTextList *)v23 setScrollEnabled:0];
      [(OBStackedIconTextList *)v23 setDataDetectorTypes:a4];
      v25 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
      v26 = (void *)[v25 mutableCopy];

      [v26 setSpansAllLines:1];
      id v27 = objc_alloc(MEMORY[0x1E4F28E48]);
      v61 = v21;
      v28 = [v21 text];
      v29 = (void *)[v27 initWithString:v28];

      objc_msgSend(v29, "addAttribute:value:range:", v60, v26, 0, objc_msgSend(v29, "length"));
      [(OBStackedIconTextList *)v23 setAttributedText:v29];
      v30 = [MEMORY[0x1E4FB1618] clearColor];
      [(OBStackedIconTextList *)v23 setBackgroundColor:v30];

      v31 = [MEMORY[0x1E4FB1618] labelColor];
      [(OBStackedIconTextList *)v23 setTextColor:v31];

      [(OBPrivacySplashListView *)v11 addArrangedSubview:v23];
      v32 = [(OBPrivacySplashListView *)v11 textViews];
      [v32 addObject:v23];

LABEL_18:
      v21 = v61;
      goto LABEL_19;
    }
LABEL_20:
    [(OBPrivacySplashListView *)v11 updateSpacing];
    [(OBPrivacySplashListView *)v11 updateTextAlignment];
    [(OBPrivacySplashListView *)v11 updateFonts];
    v49 = [(OBPrivacySplashListView *)v11 textViews];
    [(OBPrivacySplashListView *)v11 _updateTextViewsForLinkUITreatment:v49];

    v50 = [(OBPrivacySplashListView *)v11 textViews];
    uint64_t v51 = [v50 lastObject];
    footerTextView = v11->_footerTextView;
    v11->_footerTextView = (UITextView *)v51;
  }
  return v11;
}

- (void)updateSpacing
{
  id v10 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2950]];
  BOOL v3 = [(OBPrivacySplashListView *)self displayingPrivacyPane];
  double v4 = 46.0;
  if (!v3) {
    double v4 = 30.0;
  }
  [v10 scaledValueForValue:v4];
  -[OBPrivacySplashListView setSpacing:](self, "setSpacing:");
  BOOL v5 = [(OBPrivacySplashListView *)self textViews];
  if ([v5 count])
  {
    BOOL v6 = [(OBPrivacySplashListView *)self displayingPrivacyPane];

    if (v6) {
      goto LABEL_7;
    }
    [v10 scaledValueForValue:46.0];
    double v8 = v7;
    BOOL v5 = [(OBPrivacySplashListView *)self textViews];
    double v9 = [v5 objectAtIndexedSubscript:0];
    [(OBPrivacySplashListView *)self setCustomSpacing:v9 afterView:v8];
  }
LABEL_7:
}

- (void)updateFonts
{
  BOOL v3 = [(OBPrivacySplashListView *)self textViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x1E4FB2950];
    uint64_t v7 = *MEMORY[0x1E4FB28C8];
    do
    {
      double v8 = [(OBPrivacySplashListView *)self textViews];
      double v9 = [v8 objectAtIndexedSubscript:v5];

      uint64_t v10 = v7;
      if (v5)
      {
        if ([(OBPrivacySplashListView *)self displayingPrivacyPane]) {
          uint64_t v10 = v7;
        }
        else {
          uint64_t v10 = v6;
        }
      }
      v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
      [v9 setFont:v11];

      ++v5;
      uint64_t v12 = [(OBPrivacySplashListView *)self textViews];
      unint64_t v13 = [v12 count];
    }
    while (v13 > v5);
  }
}

- (void)updateTextAlignment
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (+[OBViewUtilities shouldUseAccessibilityLayout]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 1;
  }
  if ([(OBPrivacySplashListView *)self displayingPrivacyPane])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(OBPrivacySplashListView *)self textViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setTextAlignment:v3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v10 = [(OBPrivacySplashListView *)self textViews];
    double v9 = [v10 firstObject];
    [v9 setTextAlignment:v3];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBPrivacySplashListView;
  [(OBPrivacySplashListView *)&v4 traitCollectionDidChange:a3];
  [(OBPrivacySplashListView *)self updateTextAlignment];
  [(OBPrivacySplashListView *)self updateSpacing];
  [(OBPrivacySplashListView *)self updateFonts];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)OBPrivacySplashListView;
  [(OBPrivacySplashListView *)&v4 tintColorDidChange];
  uint64_t v3 = [(OBPrivacySplashListView *)self textViews];
  [(OBPrivacySplashListView *)self _updateTextViewsForLinkUITreatment:v3];
}

- (void)_updateTextViewsForLinkUITreatment:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    uint64_t v9 = *MEMORY[0x1E4FB0808];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        if ([(OBPrivacySplashListView *)self underlineLinks])
        {
          v18[0] = v8;
          long long v12 = [(OBPrivacySplashListView *)self tintColor];
          v18[1] = v9;
          v19[0] = v12;
          v19[1] = &unk_1EEC378C8;
          long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
          [v11 setLinkTextAttributes:v13];
        }
        else
        {
          [v11 setLinkTextAttributes:0];
        }
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)displayingPrivacyPane
{
  return self->_displayingPrivacyPane;
}

- (void)setDisplayingPrivacyPane:(BOOL)a3
{
  self->_displayingPrivacyPane = a3;
}

- (NSMutableArray)textViews
{
  return self->_textViews;
}

- (void)setTextViews:(id)a3
{
}

- (NSMutableArray)stackedIconTextLists
{
  return self->_stackedIconTextLists;
}

- (void)setStackedIconTextLists:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedIconTextLists, 0);
  objc_storeStrong((id *)&self->_textViews, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
}

@end