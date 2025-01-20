@interface PSTextViewPane
- (BOOL)handlesDoneButton;
- (PSTextViewPane)initWithFrame:(CGRect)a3;
- (void)setPreferenceSpecifier:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PSTextViewPane

- (BOOL)handlesDoneButton
{
  return 1;
}

- (PSTextViewPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PSTextViewPane;
  v7 = -[PSEditingPane initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F42F58] textViewUsingTextLayoutManager:0];
    textView = v7->_textView;
    v7->_textView = (UITextView *)v8;

    -[UITextView setFrame:](v7->_textView, "setFrame:", x, y, width, height);
    [(UITextView *)v7->_textView setEditable:0];
    v10 = v7->_textView;
    v11 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(UITextView *)v10 setBackgroundColor:v11];

    [(UITextView *)v7->_textView setOpaque:1];
    v12 = [MEMORY[0x1E4F42D90] mainScreen];
    [v12 scale];

    v13 = v7->_textView;
    v14 = UISystemFontForSize();
    [(UITextView *)v13 setFont:v14];

    [(UITextView *)v7->_textView setAutoresizingMask:18];
    [(PSTextViewPane *)v7 addSubview:v7->_textView];
  }
  return v7;
}

- (void)setPreferenceSpecifier:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PSTextViewPane;
  id v4 = a3;
  [(PSEditingPane *)&v16 setPreferenceSpecifier:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28E78], "string", v16.receiver, v16.super_class);
  v6 = [v4 propertyForKey:@"file-path"];

  if (v6)
  {
    v7 = [v6 pathExtension];
    uint64_t v8 = [v6 lastPathComponent];
    if ([v7 isEqualToString:@"synced"])
    {
      v9 = [v6 stringByDeletingPathExtension];
      uint64_t v10 = [v9 pathExtension];

      v7 = (void *)v10;
    }
    if ([v7 isEqualToString:@"plist"])
    {
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
      v12 = [v11 objectForKey:@"description"];
      if (v12)
      {
        uint64_t v13 = [MEMORY[0x1E4F28E78] stringWithString:v12];

        v5 = (void *)v13;
      }
    }
    else if (([v7 isEqualToString:@"metriclog"] & 1) != 0 {
           || [v6 hasSuffix:@"metriclog.anon"])
    }
    {
      setupAWDConnection();
      v11 = createDescriptionForMetriclogFile();
      if (v11)
      {
        uint64_t v14 = [MEMORY[0x1E4F28E78] stringWithString:v11];

        v5 = (void *)v14;
      }
      teardownAWDConnection();
    }
    else if ([v7 isEqualToString:@"gz"])
    {
      v11 = v5;
      v5 = 0;
    }
    else if ([v8 hasPrefix:@"HealthWrap"])
    {
      v11 = PSDescriptionForHealthAnalyticsFileWithName(v8);
      if (v11)
      {
        uint64_t v15 = [MEMORY[0x1E4F28E78] stringWithString:v11];

        v5 = (void *)v15;
      }
    }
    else
    {
      [MEMORY[0x1E4F28E78] stringWithContentsOfFile:v6 usedEncoding:0 error:0];
      v5 = v11 = v5;
    }

    [(UITextView *)self->_textView setText:v5];
  }
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end