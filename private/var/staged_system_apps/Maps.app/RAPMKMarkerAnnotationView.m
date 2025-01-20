@interface RAPMKMarkerAnnotationView
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (NSString)annotationTitle;
- (void)setAnnotationTitle:(id)a3;
@end

@implementation RAPMKMarkerAnnotationView

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = -[_RAPAnnotationTitleLabel initWithFrame:]([_RAPAnnotationTitleLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  annotationTitleLabel = self->_annotationTitleLabel;
  self->_annotationTitleLabel = v5;

  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setTextAlignment:1];
  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setAdjustsFontSizeToFitWidth:1];
  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setBaselineAdjustment:1];
  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setNumberOfLines:0];
  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = +[UIFont boldSystemFontOfSize:12.0];
  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setFont:v7];

  v8 = +[UIColor labelColor];
  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setTextColor:v8];

  [(RAPMKMarkerAnnotationView *)self addSubview:self->_annotationTitleLabel];
  v9 = [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel topAnchor];
  v10 = [(RAPMKMarkerAnnotationView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel widthAnchor];
  v13 = [v12 constraintEqualToConstant:100.0];
  [v13 setActive:1];

  v14 = [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel centerXAnchor];
  v15 = [(RAPMKMarkerAnnotationView *)self centerXAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  [(_RAPAnnotationTitleLabel *)self->_annotationTitleLabel setHidden:1];
  v18.receiver = self;
  v18.super_class = (Class)RAPMKMarkerAnnotationView;
  return [(RAPMKMarkerAnnotationView *)&v18 updateCalloutViewIfNeededAnimated:v3];
}

- (void)setAnnotationTitle:(id)a3
{
  v4 = (NSString *)[a3 copy];
  annotationTitle = self->_annotationTitle;
  self->_annotationTitle = v4;

  NSUInteger v6 = [(NSString *)self->_annotationTitle length];
  if (v6)
  {
    CFStringRef v7 = (const __CFString *)self->_annotationTitle;
    p_annotationTitleLabel = &self->_annotationTitleLabel;
    v9 = *p_annotationTitleLabel;
  }
  else
  {
    p_annotationTitleLabel = &self->_annotationTitleLabel;
    v9 = *p_annotationTitleLabel;
    CFStringRef v7 = &stru_101324E70;
  }
  [(_RAPAnnotationTitleLabel *)v9 setText:v7];
  v10 = *p_annotationTitleLabel;

  [(_RAPAnnotationTitleLabel *)v10 setHidden:v6 == 0];
}

- (NSString)annotationTitle
{
  return self->_annotationTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationTitle, 0);

  objc_storeStrong((id *)&self->_annotationTitleLabel, 0);
}

@end