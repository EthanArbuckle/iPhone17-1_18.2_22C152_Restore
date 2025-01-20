@interface ContactValueTableViewCell
- (ContactValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MSPSharedTripContact)contactValue;
- (NSLayoutConstraint)handleFirstBaselineToNameLastBaselineConstraint;
- (NSLayoutConstraint)handleLastBaselineToBottomConstraint;
- (NSLayoutConstraint)nameFirstBaselineToTopConstraint;
- (NSString)contactCapability;
- (NSString)contactHandle;
- (UIColor)capabilityColor;
- (UILabel)contactNameLabel;
- (void)_contentSizeDidChange;
- (void)prepareForReuse;
- (void)setCapabilityColor:(id)a3;
- (void)setContactCapability:(id)a3;
- (void)setContactHandle:(id)a3;
- (void)setContactNameLabel:(id)a3;
- (void)setContactValue:(id)a3;
- (void)setHandleFirstBaselineToNameLastBaselineConstraint:(id)a3;
- (void)setHandleLastBaselineToBottomConstraint:(id)a3;
- (void)setNameFirstBaselineToTopConstraint:(id)a3;
- (void)updateConstraintConstants;
- (void)updateContactLabel;
- (void)updateFonts;
@end

@implementation ContactValueTableViewCell

- (ContactValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v54.receiver = self;
  v54.super_class = (Class)ContactValueTableViewCell;
  v4 = [(ContactValueTableViewCell *)&v54 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(ContactValueTableViewCell *)v4 setAccessibilityIdentifier:@"ContactValueTableViewCell"];
    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    contactNameLabel = v5->_contactNameLabel;
    v5->_contactNameLabel = v10;

    [(UILabel *)v5->_contactNameLabel setAccessibilityIdentifier:@"ContactNameLabel"];
    [(UILabel *)v5->_contactNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(ContactValueTableViewCell *)v5 contentView];
    [v12 addSubview:v5->_contactNameLabel];

    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    contactHandleLabel = v5->_contactHandleLabel;
    v5->_contactHandleLabel = v13;

    [(UILabel *)v5->_contactHandleLabel setAccessibilityIdentifier:@"ContactHandleLabel"];
    [(UILabel *)v5->_contactHandleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(ContactValueTableViewCell *)v5 contentView];
    [v15 addSubview:v5->_contactHandleLabel];

    v16 = [(UILabel *)v5->_contactNameLabel firstBaselineAnchor];
    v17 = [(ContactValueTableViewCell *)v5 contentView];
    v18 = [v17 topAnchor];
    uint64_t v19 = [v16 constraintEqualToAnchor:v18 constant:0.0];
    nameFirstBaselineToTopConstraint = v5->_nameFirstBaselineToTopConstraint;
    v5->_nameFirstBaselineToTopConstraint = (NSLayoutConstraint *)v19;

    v21 = [(UILabel *)v5->_contactHandleLabel firstBaselineAnchor];
    v22 = [(UILabel *)v5->_contactNameLabel lastBaselineAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
    handleFirstBaselineToNameLastBaselineConstraint = v5->_handleFirstBaselineToNameLastBaselineConstraint;
    v5->_handleFirstBaselineToNameLastBaselineConstraint = (NSLayoutConstraint *)v23;

    v25 = [(UILabel *)v5->_contactHandleLabel lastBaselineAnchor];
    v26 = [(ContactValueTableViewCell *)v5 contentView];
    v27 = [v26 bottomAnchor];
    uint64_t v28 = [v25 constraintEqualToAnchor:v27 constant:0.0];
    handleLastBaselineToBottomConstraint = v5->_handleLastBaselineToBottomConstraint;
    v5->_handleLastBaselineToBottomConstraint = (NSLayoutConstraint *)v28;

    v55[0] = v5->_nameFirstBaselineToTopConstraint;
    v55[1] = v5->_handleFirstBaselineToNameLastBaselineConstraint;
    v55[2] = v5->_handleLastBaselineToBottomConstraint;
    v52 = [(UILabel *)v5->_contactNameLabel leadingAnchor];
    v53 = [(ContactValueTableViewCell *)v5 contentView];
    v51 = [v53 layoutMarginsGuide];
    v50 = [v51 leadingAnchor];
    v49 = [v52 constraintEqualToAnchor:v50];
    v55[3] = v49;
    v47 = [(UILabel *)v5->_contactNameLabel trailingAnchor];
    v48 = [(ContactValueTableViewCell *)v5 contentView];
    v46 = [v48 layoutMarginsGuide];
    v45 = [v46 trailingAnchor];
    v44 = [v47 constraintEqualToAnchor:v45];
    v55[4] = v44;
    v42 = [(UILabel *)v5->_contactHandleLabel leadingAnchor];
    v43 = [(ContactValueTableViewCell *)v5 contentView];
    v30 = [v43 layoutMarginsGuide];
    v31 = [v30 leadingAnchor];
    v32 = [v42 constraintEqualToAnchor:v31];
    v55[5] = v32;
    v33 = [(UILabel *)v5->_contactHandleLabel trailingAnchor];
    v34 = [(ContactValueTableViewCell *)v5 contentView];
    v35 = [v34 layoutMarginsGuide];
    v36 = [v35 trailingAnchor];
    v37 = [v33 constraintEqualToAnchor:v36];
    v55[6] = v37;
    v38 = +[NSArray arrayWithObjects:v55 count:7];
    +[NSLayoutConstraint activateConstraints:v38];

    v39 = +[UIColor clearColor];
    [(ContactValueTableViewCell *)v5 setBackgroundColor:v39];

    v40 = +[NSNotificationCenter defaultCenter];
    [v40 addObserver:v5 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(ContactValueTableViewCell *)v5 _contentSizeDidChange];
  }
  return v5;
}

- (void)_contentSizeDidChange
{
  [(ContactValueTableViewCell *)self updateConstraintConstants];

  [(ContactValueTableViewCell *)self updateFonts];
}

- (void)updateConstraintConstants
{
  id v4 = +[UIFont system15];
  [v4 _mapkit_scaledValueForValue:34.0];
  -[NSLayoutConstraint setConstant:](self->_nameFirstBaselineToTopConstraint, "setConstant:");
  [v4 _mapkit_scaledValueForValue:24.0];
  -[NSLayoutConstraint setConstant:](self->_handleFirstBaselineToNameLastBaselineConstraint, "setConstant:");
  [v4 _mapkit_scaledValueForValue:18.0];
  [(NSLayoutConstraint *)self->_handleLastBaselineToBottomConstraint setConstant:-v3];
}

- (void)updateFonts
{
  double v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  [(UILabel *)self->_contactNameLabel setFont:v3];

  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_contactHandleLabel setFont:v4];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)ContactValueTableViewCell;
  [(ContactValueTableViewCell *)&v4 prepareForReuse];
  [(ContactValueTableViewCell *)self setContactValue:0];
  [(ContactValueTableViewCell *)self setContactHandle:0];
  [(ContactValueTableViewCell *)self setContactCapability:0];
  [(UILabel *)self->_contactNameLabel setText:&stru_101324E70];
  [(UILabel *)self->_contactHandleLabel setText:&stru_101324E70];
  double v3 = +[UIColor secondaryLabelColor];
  [(ContactValueTableViewCell *)self setCapabilityColor:v3];
}

- (void)setContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_contactHandle, a3);

  [(ContactValueTableViewCell *)self updateContactLabel];
}

- (void)setContactCapability:(id)a3
{
  objc_storeStrong((id *)&self->_contactCapability, a3);

  [(ContactValueTableViewCell *)self updateContactLabel];
}

- (void)updateContactLabel
{
  if ([(NSString *)self->_contactCapability length])
  {
    id v5 = +[NSString stringWithFormat:@"%@ • %@", self->_contactHandle, self->_contactCapability];
    [(UILabel *)self->_contactHandleLabel setText:v5];
  }
  else
  {
    contactHandle = self->_contactHandle;
    contactHandleLabel = self->_contactHandleLabel;
    [(UILabel *)contactHandleLabel setText:contactHandle];
  }
}

- (void)setCapabilityColor:(id)a3
{
  objc_storeStrong((id *)&self->_capabilityColor, a3);
  id v5 = a3;
  [(UILabel *)self->_contactHandleLabel setTextColor:v5];
  [(UILabel *)self->_contactNameLabel setTextColor:v5];
}

- (MSPSharedTripContact)contactValue
{
  return self->_contactValue;
}

- (void)setContactValue:(id)a3
{
}

- (UILabel)contactNameLabel
{
  return self->_contactNameLabel;
}

- (void)setContactNameLabel:(id)a3
{
}

- (NSString)contactHandle
{
  return self->_contactHandle;
}

- (NSString)contactCapability
{
  return self->_contactCapability;
}

- (UIColor)capabilityColor
{
  return self->_capabilityColor;
}

- (NSLayoutConstraint)nameFirstBaselineToTopConstraint
{
  return self->_nameFirstBaselineToTopConstraint;
}

- (void)setNameFirstBaselineToTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)handleFirstBaselineToNameLastBaselineConstraint
{
  return self->_handleFirstBaselineToNameLastBaselineConstraint;
}

- (void)setHandleFirstBaselineToNameLastBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)handleLastBaselineToBottomConstraint
{
  return self->_handleLastBaselineToBottomConstraint;
}

- (void)setHandleLastBaselineToBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_handleFirstBaselineToNameLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_nameFirstBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_capabilityColor, 0);
  objc_storeStrong((id *)&self->_contactCapability, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_contactValue, 0);

  objc_storeStrong((id *)&self->_contactHandleLabel, 0);
}

@end