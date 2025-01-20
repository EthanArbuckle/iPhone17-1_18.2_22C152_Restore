@interface TransferMailboxPickerPalette
+ (double)defaultHeight;
- (CGRect)_contentRect;
- (CGRect)messageThumbnailViewFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)senders;
- (NSString)subject;
- (TransferMailboxPickerPalette)initWithFrame:(CGRect)a3;
- (UIView)messageThumbnailView;
- (id)_senderStringForWidth:(double)a3;
- (unint64_t)messageCount;
- (void)_drawThumbnailInContext:(CGContext *)a3 view:(id)a4 frame:(CGRect)a5;
- (void)layoutSubviews;
- (void)setMessageCount:(unint64_t)a3;
- (void)setMessageThumbnailWithView:(id)a3;
- (void)setSenders:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation TransferMailboxPickerPalette

- (TransferMailboxPickerPalette)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)TransferMailboxPickerPalette;
  v3 = -[TransferMailboxPickerPalette initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TransferMailboxPickerPalette *)v3 setAutoresizingMask:2];
    [(TransferMailboxPickerPalette *)v4 setOpaque:0];
    [(TransferMailboxPickerPalette *)v4 setBackgroundColor:0];
    v5 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleHeadline1 addingSymbolicTraits:0x8000 options:0];
    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    sendersLabel = v4->_sendersLabel;
    v4->_sendersLabel = v10;

    v12 = +[UIFont fontWithDescriptor:v5 size:0.0];
    [(UILabel *)v4->_sendersLabel setFont:v12];

    [(UILabel *)v4->_sendersLabel setOpaque:0];
    [(UILabel *)v4->_sendersLabel setBackgroundColor:0];
    v13 = +[UIColor labelColor];
    [(UILabel *)v4->_sendersLabel setTextColor:v13];

    [(UILabel *)v4->_sendersLabel setLineBreakMode:4];
    [(UILabel *)v4->_sendersLabel setNumberOfLines:1];
    [(TransferMailboxPickerPalette *)v4 addSubview:v4->_sendersLabel];
    v14 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleSubheadline2 addingSymbolicTraits:0x8000 options:0];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subjectLabel = v4->_subjectLabel;
    v4->_subjectLabel = v15;

    v17 = +[UIFont fontWithDescriptor:v14 size:0.0];
    [(UILabel *)v4->_subjectLabel setFont:v17];

    [(UILabel *)v4->_subjectLabel setOpaque:0];
    [(UILabel *)v4->_subjectLabel setBackgroundColor:0];
    v18 = +[UIColor labelColor];
    [(UILabel *)v4->_subjectLabel setTextColor:v18];

    [(UILabel *)v4->_subjectLabel setLineBreakMode:4];
    [(UILabel *)v4->_subjectLabel setNumberOfLines:1];
    [(TransferMailboxPickerPalette *)v4 addSubview:v4->_subjectLabel];
  }
  return v4;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return [(UILabel *)self->_subjectLabel text];
}

- (void)setMessageThumbnailWithView:(id)a3
{
  id v4 = a3;
  messageThumbnailView = self->_messageThumbnailView;
  if (messageThumbnailView)
  {
    [(UIImageView *)messageThumbnailView removeFromSuperview];
    id v6 = self->_messageThumbnailView;
    self->_messageThumbnailView = 0;
  }
  if (v4) {
    [v4 bounds];
  }
  UIRoundToViewScale();
  if (v7 <= 58.0) {
    double v8 = v7;
  }
  else {
    double v8 = 58.0;
  }
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  unint64_t messageCount = self->_messageCount;
  unint64_t v29 = messageCount;
  if (!messageCount)
  {
    unint64_t messageCount = 1;
    goto LABEL_12;
  }
  if (messageCount >= 4)
  {
    unint64_t messageCount = 3;
LABEL_12:
    unint64_t v29 = messageCount;
  }
  id v10 = objc_alloc((Class)UIGraphicsImageRenderer);
  v11 = +[UIGraphicsImageRendererFormat preferredFormat];
  id v12 = [v10 initWithSize:v11 format:35.0, v8 + (double)(messageCount - 1) * 2.5];

  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  objc_super v20 = sub_100223164;
  v21 = &unk_10060E158;
  v24 = v28;
  id v13 = v4;
  double v25 = v8 + (double)(messageCount - 1) * 2.5;
  double v26 = v8;
  uint64_t v27 = 0x4041800000000000;
  id v22 = v13;
  v23 = self;
  v14 = [v12 imageWithActions:&v18];
  id v15 = objc_alloc((Class)UIImageView);
  v16 = [v15 initWithImage:v14, v18, v19, v20, v21];
  v17 = self->_messageThumbnailView;
  self->_messageThumbnailView = v16;

  [(TransferMailboxPickerPalette *)self addSubview:self->_messageThumbnailView];
  [(TransferMailboxPickerPalette *)self setNeedsLayout];

  _Block_object_dispose(v28, 8);
}

- (void)_drawThumbnailInContext:(CGContext *)a3 view:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v26 = a4;
  if (v26)
  {
    v11 = +[UIColor mailAppBackgroundColor];
    [v11 set];

    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    CGContextFillRect(a3, v28);
    [v26 bounds];
    double v13 = v12;
    double v15 = v14;
    CGContextSaveGState(a3);
    CGContextTranslateCTM(a3, x, y);
    CGContextScaleCTM(a3, width / v13, height / v15);
    v16 = [v26 layer];
    [v16 renderInContext:a3];

    CGContextRestoreGState(a3);
  }
  else
  {
    v17 = +[UIColor whiteColor];
    [v17 set];

    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    CGContextFillRect(a3, v29);
  }
  [(TransferMailboxPickerPalette *)self mui_currentScreenScale];
  CGFloat v19 = 1.0 / v18;
  CGFloat v20 = 1.0 / v18 * 0.5;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGRect v31 = CGRectInset(v30, v20, v20);
  CGFloat v21 = v31.origin.x;
  CGFloat v22 = v31.origin.y;
  CGFloat v23 = v31.size.width;
  CGFloat v24 = v31.size.height;
  double v25 = +[UIColor colorWithWhite:0.843137255 alpha:1.0];
  [v25 set];

  v32.origin.CGFloat x = v21;
  v32.origin.CGFloat y = v22;
  v32.size.double width = v23;
  v32.size.double height = v24;
  CGContextStrokeRectWithWidth(a3, v32, v19);
}

- (id)_senderStringForWidth:(double)a3
{
  if ([(NSArray *)self->_senders count])
  {
    id v39 = [(UILabel *)self->_sendersLabel font];
    MFLocalizedAddressSeparator();
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    [v36 _legacy_sizeWithFont:v39];
    double v6 = v5;
    NSUInteger v7 = [(NSArray *)self->_senders count];
    uint64_t v35 = (uint64_t)&v35;
    uint64_t v8 = __chkstk_darwin(v7);
    id v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8) {
      memset((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 255, v9);
    }
    unint64_t v11 = 0;
    v37 = v10;
    v38 = v10 - 8;
    double v12 = 0.0;
    do
    {
      double v13 = [(NSArray *)self->_senders objectAtIndex:v11];
      [v13 _legacy_sizeWithFont:v39];
      double v15 = v14;
      *(double *)&v10[8 * v11] = v14;

      if (v11)
      {
        double v15 = v6 + v15;
        *(double *)&v10[8 * v11] = v15;
      }
      double v16 = v12 + v15;
      if (v12 + v15 <= a3)
      {
        ++v11;
        double v12 = v12 + v15;
      }
      else
      {
        uint64_t v17 = -(uint64_t)v11;
        double v18 = (double *)&v38[8 * v11];
        while (1)
        {
          CGFloat v19 = +[NSNumberFormatter ef_formatInteger:(char *)[(NSArray *)self->_senders count] + v17 withGrouping:1];
          CGFloat v20 = +[NSBundle mainBundle];
          CGFloat v21 = [v20 localizedStringForKey:@"AND_N_MORE" value:&stru_100619928 table:@"Main"];

          CGFloat v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v19);
          [v22 _legacy_sizeWithFont:v39];
          double v24 = v23;

          if (!v17 || v12 + v24 <= a3) {
            break;
          }
          double v25 = *v18--;
          double v12 = v12 - v25;

          ++v17;
        }

        unint64_t v11 = -v17;
        id v10 = v37;
      }
    }
    while (v11 < [(NSArray *)self->_senders count] && v16 <= a3);
    senders = self->_senders;
    if (v11)
    {
      uint64_t v27 = -[NSArray subarrayWithRange:](senders, "subarrayWithRange:", 0, v11);
      CGRect v28 = [v27 ef_map:&stru_10060E178];
      CGRect v29 = [v28 componentsJoinedByString:v36];

      if (v11 < [(NSArray *)self->_senders count])
      {
        CGRect v30 = +[NSNumberFormatter ef_formatInteger:(char *)[(NSArray *)self->_senders count] - v11 withGrouping:1];
        CGRect v31 = +[NSBundle mainBundle];
        CGRect v32 = [v31 localizedStringForKey:@"AND_N_MORE" value:&stru_100619928 table:@"Main"];

        uint64_t v33 = [v29 stringByAppendingFormat:v32, v30];

        CGRect v29 = (void *)v33;
      }
    }
    else
    {
      CGRect v29 = [(NSArray *)senders objectAtIndex:0];
    }
  }
  else
  {
    CGRect v29 = 0;
  }

  return v29;
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)TransferMailboxPickerPalette;
  [(TransferMailboxPickerPalette *)&v45 layoutSubviews];
  unsigned __int8 v3 = [(TransferMailboxPickerPalette *)self mf_prefersRightToLeftInterfaceLayout];
  [(TransferMailboxPickerPalette *)self _contentRect];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  uint64_t v11 = v10;
  double v12 = v8 + -67.0 + -16.0;
  double v13 = [(TransferMailboxPickerPalette *)self _senderStringForWidth:v12];
  [(UILabel *)self->_sendersLabel setText:v13];

  uint64_t v14 = v5;
  uint64_t v15 = v7;
  double v16 = v9;
  uint64_t v17 = v11;
  if (v3) {
    double v18 = CGRectGetMaxX(*(CGRect *)&v14) - v12 + -67.0;
  }
  else {
    double v18 = CGRectGetMinX(*(CGRect *)&v14) + 67.0;
  }
  double height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_sendersLabel, "sizeThatFits:", CGSizeZero.width, height);
  -[UILabel setFrame:](self->_sendersLabel, "setFrame:", v18, 0.0, v12, v20);
  -[UILabel sizeThatFits:](self->_subjectLabel, "sizeThatFits:", CGSizeZero.width, height);
  -[UILabel setFrame:](self->_subjectLabel, "setFrame:", v18, 0.0, v12, v21);
  CGFloat v22 = [(UILabel *)self->_subjectLabel font];
  [v22 _bodyLeading];
  UIRoundToViewScale();
  double v24 = v23;

  [(UILabel *)self->_sendersLabel _firstLineBaselineOffsetFromBoundsTop];
  [(UILabel *)self->_subjectLabel _setFirstLineCapFrameOriginY:v24 + v25];
  [(UILabel *)self->_subjectLabel frame];
  CGRectGetMaxY(v46);
  UIRoundToViewScale();
  double v27 = v26;
  [(UILabel *)self->_sendersLabel frame];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  [(UILabel *)self->_subjectLabel frame];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v42 = v27 + v31;
  double v44 = v27 + v43;
  -[UILabel setFrame:](self->_sendersLabel, "setFrame:", v29, v42, v33, v35);
  -[UILabel setFrame:](self->_subjectLabel, "setFrame:", v37, v44, v39, v41);
  if (self->_messageThumbnailView)
  {
    [(TransferMailboxPickerPalette *)self messageThumbnailViewFrame];
    -[UIImageView setFrame:](self->_messageThumbnailView, "setFrame:");
  }
}

- (CGRect)messageThumbnailViewFrame
{
  [(UIImageView *)self->_messageThumbnailView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TransferMailboxPickerPalette *)self _contentRect];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  unsigned __int8 v19 = [(TransferMailboxPickerPalette *)self mf_prefersRightToLeftInterfaceLayout];
  uint64_t v20 = v12;
  uint64_t v21 = v14;
  uint64_t v22 = v16;
  uint64_t v23 = v18;
  if (v19) {
    CGRectGetMaxX(*(CGRect *)&v20);
  }
  else {
    CGRectGetMinX(*(CGRect *)&v20);
  }
  v30.origin.CGFloat x = v4;
  v30.origin.CGFloat y = v6;
  v30.size.double width = v8;
  v30.size.double height = v10;
  CGRectGetWidth(v30);
  UIRoundToViewScale();
  CGFloat x = v31.origin.x;
  v31.origin.CGFloat y = v6;
  v31.size.double width = v8;
  v31.size.double height = v10;
  CGRectGetHeight(v31);
  UIRoundToViewScale();
  double v26 = v25;
  double v27 = x;
  double v28 = v8;
  double v29 = v10;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)_contentRect
{
  [(TransferMailboxPickerPalette *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  [(TransferMailboxPickerPalette *)self bounds];
  double v9 = v4 + v8;
  double v11 = v10 + 0.0;
  double v13 = v12 - (v4 + v6);
  result.size.double height = v7;
  result.size.double width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() defaultHeight];
  double v5 = v4;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

+ (double)defaultHeight
{
  return 68.0;
}

- (UIView)messageThumbnailView
{
  return &self->_messageThumbnailView->super;
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
}

- (unint64_t)messageCount
{
  return self->_messageCount;
}

- (void)setMessageCount:(unint64_t)a3
{
  self->_unint64_t messageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageThumbnailView, 0);
  objc_storeStrong((id *)&self->_subjectLabel, 0);
  objc_storeStrong((id *)&self->_sendersLabel, 0);

  objc_storeStrong((id *)&self->_senders, 0);
}

@end