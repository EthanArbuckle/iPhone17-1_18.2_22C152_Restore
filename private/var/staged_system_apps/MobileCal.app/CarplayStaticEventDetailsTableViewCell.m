@interface CarplayStaticEventDetailsTableViewCell
- (BOOL)isSelectable;
- (BOOL)showDayName;
- (CarplayStaticEventDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (EKEvent)event;
- (NSLayoutConstraint)dateBaselineToLocationBaselineConstraint;
- (NSLayoutConstraint)dateBaselineToTitleBaselineConstraint;
- (NSLayoutConstraint)locationBaselineToTitleBaselineConstraint;
- (NSLayoutConstraint)timeBaselineToDateBaselineConstraint;
- (NSLayoutConstraint)timeBaselineToLocationBaselineConstraint;
- (NSLayoutConstraint)timeBaselineToTitleBaselineConstraint;
- (UILabel)dateView;
- (UILabel)locationView;
- (UILabel)timeView;
- (UILabel)titleView;
- (id)_createPrimaryView;
- (id)_createSecondaryView;
- (id)_titleFont;
- (void)cellWasTapped;
- (void)setDateBaselineToLocationBaselineConstraint:(id)a3;
- (void)setDateBaselineToTitleBaselineConstraint:(id)a3;
- (void)setDateView:(id)a3;
- (void)setEvent:(id)a3;
- (void)setLocationBaselineToTitleBaselineConstraint:(id)a3;
- (void)setLocationView:(id)a3;
- (void)setShowDayName:(BOOL)a3;
- (void)setTimeBaselineToDateBaselineConstraint:(id)a3;
- (void)setTimeBaselineToLocationBaselineConstraint:(id)a3;
- (void)setTimeBaselineToTitleBaselineConstraint:(id)a3;
- (void)setTimeView:(id)a3;
- (void)setTitleView:(id)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation CarplayStaticEventDetailsTableViewCell

- (CarplayStaticEventDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v72.receiver = self;
  v72.super_class = (Class)CarplayStaticEventDetailsTableViewCell;
  v4 = [(CarplayStaticEventDetailsTableViewCell *)&v72 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CarplayStaticEventDetailsTableViewCell *)v4 setUserInteractionEnabled:0];
    v6 = +[UIColor clearColor];
    [(CarplayStaticEventDetailsTableViewCell *)v5 setBackgroundColor:v6];

    uint64_t v7 = [(CarplayStaticEventDetailsTableViewCell *)v5 _createPrimaryView];
    titleView = v5->_titleView;
    v5->_titleView = (UILabel *)v7;

    uint64_t v9 = [(CarplayStaticEventDetailsTableViewCell *)v5 _createSecondaryView];
    locationView = v5->_locationView;
    v5->_locationView = (UILabel *)v9;

    v11 = +[UIColor labelColor];
    [(UILabel *)v5->_locationView setTextColor:v11];

    uint64_t v12 = [(CarplayStaticEventDetailsTableViewCell *)v5 _createSecondaryView];
    dateView = v5->_dateView;
    v5->_dateView = (UILabel *)v12;

    uint64_t v14 = [(CarplayStaticEventDetailsTableViewCell *)v5 _createSecondaryView];
    timeView = v5->_timeView;
    v5->_timeView = (UILabel *)v14;

    [(CarplayStaticEventDetailsTableViewCell *)v5 addSubview:v5->_titleView];
    [(CarplayStaticEventDetailsTableViewCell *)v5 addSubview:v5->_locationView];
    [(CarplayStaticEventDetailsTableViewCell *)v5 addSubview:v5->_dateView];
    [(CarplayStaticEventDetailsTableViewCell *)v5 addSubview:v5->_timeView];
    v16 = [(UILabel *)v5->_timeView firstBaselineAnchor];
    v17 = [(UILabel *)v5->_dateView lastBaselineAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17 constant:20.0];
    timeBaselineToDateBaselineConstraint = v5->_timeBaselineToDateBaselineConstraint;
    v5->_timeBaselineToDateBaselineConstraint = (NSLayoutConstraint *)v18;

    v20 = [(UILabel *)v5->_timeView firstBaselineAnchor];
    v21 = [(UILabel *)v5->_titleView lastBaselineAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21 constant:24.0];
    timeBaselineToTitleBaselineConstraint = v5->_timeBaselineToTitleBaselineConstraint;
    v5->_timeBaselineToTitleBaselineConstraint = (NSLayoutConstraint *)v22;

    v24 = [(UILabel *)v5->_timeView firstBaselineAnchor];
    v25 = [(UILabel *)v5->_locationView lastBaselineAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25 constant:28.0];
    timeBaselineToLocationBaselineConstraint = v5->_timeBaselineToLocationBaselineConstraint;
    v5->_timeBaselineToLocationBaselineConstraint = (NSLayoutConstraint *)v26;

    v28 = [(UILabel *)v5->_dateView firstBaselineAnchor];
    v29 = [(UILabel *)v5->_titleView lastBaselineAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29 constant:24.0];
    dateBaselineToTitleBaselineConstraint = v5->_dateBaselineToTitleBaselineConstraint;
    v5->_dateBaselineToTitleBaselineConstraint = (NSLayoutConstraint *)v30;

    v32 = [(UILabel *)v5->_dateView firstBaselineAnchor];
    v33 = [(UILabel *)v5->_locationView lastBaselineAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33 constant:28.0];
    dateBaselineToLocationBaselineConstraint = v5->_dateBaselineToLocationBaselineConstraint;
    v5->_dateBaselineToLocationBaselineConstraint = (NSLayoutConstraint *)v34;

    v36 = [(UILabel *)v5->_locationView firstBaselineAnchor];
    v37 = [(UILabel *)v5->_titleView lastBaselineAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37 constant:20.0];
    locationBaselineToTitleBaselineConstraint = v5->_locationBaselineToTitleBaselineConstraint;
    v5->_locationBaselineToTitleBaselineConstraint = (NSLayoutConstraint *)v38;

    v71 = [(UILabel *)v5->_titleView firstBaselineAnchor];
    v70 = [(CarplayStaticEventDetailsTableViewCell *)v5 topAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:20.0];
    v73[0] = v69;
    v68 = [(UILabel *)v5->_titleView leadingAnchor];
    v67 = [(CarplayStaticEventDetailsTableViewCell *)v5 leadingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67 constant:12.0];
    v73[1] = v66;
    v65 = [(UILabel *)v5->_titleView trailingAnchor];
    v64 = [(CarplayStaticEventDetailsTableViewCell *)v5 trailingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v73[2] = v63;
    v62 = [(UILabel *)v5->_locationView leadingAnchor];
    v61 = [(CarplayStaticEventDetailsTableViewCell *)v5 leadingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:12.0];
    v73[3] = v60;
    v59 = [(UILabel *)v5->_locationView trailingAnchor];
    v58 = [(CarplayStaticEventDetailsTableViewCell *)v5 trailingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v73[4] = v57;
    v56 = [(UILabel *)v5->_dateView leadingAnchor];
    v55 = [(CarplayStaticEventDetailsTableViewCell *)v5 leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55 constant:12.0];
    v73[5] = v54;
    v53 = [(UILabel *)v5->_dateView trailingAnchor];
    v52 = [(CarplayStaticEventDetailsTableViewCell *)v5 trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v73[6] = v51;
    v50 = [(UILabel *)v5->_timeView leadingAnchor];
    v40 = [(CarplayStaticEventDetailsTableViewCell *)v5 leadingAnchor];
    v41 = [v50 constraintEqualToAnchor:v40 constant:12.0];
    v73[7] = v41;
    v42 = [(UILabel *)v5->_timeView trailingAnchor];
    v43 = [(CarplayStaticEventDetailsTableViewCell *)v5 trailingAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v73[8] = v44;
    v45 = [(UILabel *)v5->_timeView lastBaselineAnchor];
    v46 = [(CarplayStaticEventDetailsTableViewCell *)v5 bottomAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:-14.0];
    v73[9] = v47;
    v48 = +[NSArray arrayWithObjects:v73 count:10];
    +[NSLayoutConstraint activateConstraints:v48];
  }
  return v5;
}

- (id)_createPrimaryView
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = +[UIColor labelColor];
  [v3 setTextColor:v4];

  v5 = [(CarplayStaticEventDetailsTableViewCell *)self _titleFont];
  [v3 setFont:v5];

  v6 = +[UIColor clearColor];
  [v3 setBackgroundColor:v6];

  [v3 setNumberOfLines:0];

  return v3;
}

- (id)_titleFont
{
  v2 = [(CarplayStaticEventDetailsTableViewCell *)self traitCollection];
  id v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3 compatibleWithTraitCollection:v2];

  v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  v5 = +[UIFont fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)_createSecondaryView
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = +[UIColor _carSystemPrimaryColor];
  [v3 setTextColor:v4];

  v5 = [(CarplayStaticEventDetailsTableViewCell *)self traitCollection];
  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v5];
  [v3 setFont:v6];

  return v3;
}

- (void)updateWithEvent:(id)a3
{
  id v4 = a3;
  [(CarplayStaticEventDetailsTableViewCell *)self setEvent:v4];
  v5 = [v4 virtualConference];
  v6 = [v5 joinMethods];
  uint64_t v7 = [v6 firstObject];
  v8 = [v7 URL];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v4 conferenceURLForDisplay];
  }
  id v11 = v10;

  uint64_t v12 = [v4 virtualConference];
  v13 = [v12 joinMethods];
  uint64_t v14 = [v13 firstObject];
  id v15 = [v14 isBroadcast];

  v16 = +[CUIKLocationDescriptionGenerator conferenceStringForURL:v11 conferenceURLIsBroadcast:v15 options:96];
  BOOL v17 = !+[CarplayUtilities eventCanDialIn:v4]
     && [v16 length] != 0;
  v69 = v11;
  if (+[CarplayUtilities eventCanNavigate:v4])
  {
    BOOL v18 = 0;
  }
  else
  {
    v19 = [(CarplayStaticEventDetailsTableViewCell *)self event];
    v20 = [v19 location];
    BOOL v18 = [v20 length] != 0;
  }
  BOOL v21 = v17 || v18;
  uint64_t v22 = [(CarplayStaticEventDetailsTableViewCell *)self locationBaselineToTitleBaselineConstraint];
  v23 = v22;
  v70 = v16;
  if (v17 || v18)
  {
    [v22 setActive:1];

    if (v17)
    {
      v24 = [v16 string];
      int64_t v25 = +[CarplayUtilities numberOfLinesInString:v24];

      if (!v18)
      {
LABEL_17:
        [(UILabel *)self->_locationView setNumberOfLines:v25];
        id v28 = objc_alloc_init((Class)NSMutableAttributedString);
        if (v18)
        {
          id v29 = objc_alloc((Class)NSAttributedString);
          uint64_t v30 = [(CarplayStaticEventDetailsTableViewCell *)self event];
          v31 = [v30 location];
          id v32 = [v29 initWithString:v31];
          [v28 appendAttributedString:v32];

          if (v17)
          {
            id v33 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
            [v28 appendAttributedString:v33];

LABEL_21:
            [v28 appendAttributedString:v70];
          }
        }
        else if (v17)
        {
          goto LABEL_21;
        }
        id v34 = objc_alloc_init((Class)NSMutableParagraphStyle);
        [v34 setLineSpacing:-1.0];
        [v34 setLineBreakMode:4];
        [v28 addAttribute:NSParagraphStyleAttributeName value:v34 range:0, [v28 length]];
        [(UILabel *)self->_locationView setAttributedText:v28];

        goto LABEL_23;
      }
    }
    else
    {
      int64_t v25 = 0;
      if (!v18) {
        goto LABEL_17;
      }
    }
    uint64_t v26 = [(CarplayStaticEventDetailsTableViewCell *)self event];
    v27 = [v26 location];
    v25 += +[CarplayUtilities numberOfLinesInString:v27];

    goto LABEL_17;
  }
  [v22 setActive:0];

  [(UILabel *)self->_locationView setText:0];
LABEL_23:
  v35 = [(CarplayStaticEventDetailsTableViewCell *)self event];
  [(CarplayStaticEventDetailsTableViewCell *)self showDayName];
  CalDetailStringsForCalendarEvent();
  id v36 = 0;
  id v37 = 0;
  id v38 = 0;
  id v39 = 0;

  [(UILabel *)self->_dateView setText:v36];
  [(UILabel *)self->_timeView setText:v37];
  char v40 = !v21;
  if (!v36 || !v21)
  {
    if (v36) {
      char v48 = v17 || v18;
    }
    else {
      char v48 = 1;
    }
    if (v48)
    {
      if (v36) {
        char v40 = 1;
      }
      if (v40)
      {
        if (v21 || v36 != 0) {
          goto LABEL_40;
        }
        v49 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToDateBaselineConstraint];
        [v49 setActive:0];

        v50 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToTitleBaselineConstraint];
        [v50 setActive:1];

        v51 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToLocationBaselineConstraint];
        v52 = v51;
        uint64_t v53 = 0;
      }
      else
      {
        v60 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToDateBaselineConstraint];
        [v60 setActive:0];

        v61 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToTitleBaselineConstraint];
        [v61 setActive:0];

        v51 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToLocationBaselineConstraint];
        v52 = v51;
        uint64_t v53 = 1;
      }
      [v51 setActive:v53];

      v57 = [(CarplayStaticEventDetailsTableViewCell *)self dateBaselineToTitleBaselineConstraint];
      v58 = v57;
      uint64_t v59 = 0;
    }
    else
    {
      v54 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToDateBaselineConstraint];
      [v54 setActive:1];

      v55 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToTitleBaselineConstraint];
      [v55 setActive:0];

      v56 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToLocationBaselineConstraint];
      [v56 setActive:0];

      v57 = [(CarplayStaticEventDetailsTableViewCell *)self dateBaselineToTitleBaselineConstraint];
      v58 = v57;
      uint64_t v59 = 1;
    }
    [v57 setActive:v59];

    v45 = [(CarplayStaticEventDetailsTableViewCell *)self dateBaselineToLocationBaselineConstraint];
    v46 = v45;
    uint64_t v47 = 0;
  }
  else
  {
    v41 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToDateBaselineConstraint];
    [v41 setActive:1];

    v42 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToTitleBaselineConstraint];
    [v42 setActive:0];

    v43 = [(CarplayStaticEventDetailsTableViewCell *)self timeBaselineToLocationBaselineConstraint];
    [v43 setActive:0];

    v44 = [(CarplayStaticEventDetailsTableViewCell *)self dateBaselineToTitleBaselineConstraint];
    [v44 setActive:0];

    v45 = [(CarplayStaticEventDetailsTableViewCell *)self dateBaselineToLocationBaselineConstraint];
    v46 = v45;
    uint64_t v47 = 1;
  }
  [v45 setActive:v47];

LABEL_40:
  v62 = [(CarplayStaticEventDetailsTableViewCell *)self event];
  id v63 = [v62 status];

  if (v63 == (id)3)
  {
    id v64 = objc_alloc((Class)NSAttributedString);
    v65 = [(CarplayStaticEventDetailsTableViewCell *)self event];
    v66 = [v65 title];
    NSAttributedStringKey v71 = NSStrikethroughStyleAttributeName;
    objc_super v72 = &off_1001DC770;
    v67 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    id v68 = [v64 initWithString:v66 attributes:v67];
    [(UILabel *)self->_titleView setAttributedText:v68];
  }
  else
  {
    v65 = [(CarplayStaticEventDetailsTableViewCell *)self event];
    v66 = [v65 title];
    [(UILabel *)self->_titleView setText:v66];
  }
}

- (BOOL)isSelectable
{
  return 0;
}

- (void)cellWasTapped
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2, self, @"CarplayStaticEventDetailsTableViewCell.m", 214, @"Static event details cell was tapped, but it should not have been able to be selected" object file lineNumber description];
}

- (BOOL)showDayName
{
  return self->_showDayName;
}

- (void)setShowDayName:(BOOL)a3
{
  self->_showDayName = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UILabel)locationView
{
  return self->_locationView;
}

- (void)setLocationView:(id)a3
{
}

- (UILabel)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
}

- (UILabel)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
}

- (NSLayoutConstraint)timeBaselineToDateBaselineConstraint
{
  return self->_timeBaselineToDateBaselineConstraint;
}

- (void)setTimeBaselineToDateBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeBaselineToTitleBaselineConstraint
{
  return self->_timeBaselineToTitleBaselineConstraint;
}

- (void)setTimeBaselineToTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)locationBaselineToTitleBaselineConstraint
{
  return self->_locationBaselineToTitleBaselineConstraint;
}

- (void)setLocationBaselineToTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeBaselineToLocationBaselineConstraint
{
  return self->_timeBaselineToLocationBaselineConstraint;
}

- (void)setTimeBaselineToLocationBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)dateBaselineToTitleBaselineConstraint
{
  return self->_dateBaselineToTitleBaselineConstraint;
}

- (void)setDateBaselineToTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)dateBaselineToLocationBaselineConstraint
{
  return self->_dateBaselineToLocationBaselineConstraint;
}

- (void)setDateBaselineToLocationBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateBaselineToLocationBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_dateBaselineToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeBaselineToLocationBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_locationBaselineToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeBaselineToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeBaselineToDateBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_locationView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end