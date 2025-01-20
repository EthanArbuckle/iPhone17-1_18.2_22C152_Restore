@interface MacUserProfileTipViewController
- (MacUserProfileTipViewController)initWithUserProfileLinkType:(int64_t)a3;
- (id)_setupTextString:(id)a3 withImage:(id)a4;
- (int64_t)userProfileLinkType;
- (void)viewDidLoad;
@end

@implementation MacUserProfileTipViewController

- (MacUserProfileTipViewController)initWithUserProfileLinkType:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MacUserProfileTipViewController;
  v4 = [(MacUserProfileTipViewController *)&v19 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(MacUserProfileTipViewController *)v4 setAccessibilityIdentifier:v6];

    v4->_userProfileLinkType = a3;
    if (a3 == 2)
    {
      v13 = +[NSBundle mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"[User Profile Mac Tooltip - Guides] guide" value:@"localized string not found" table:0];
      linkTypeStringSingular = v4->_linkTypeStringSingular;
      v4->_linkTypeStringSingular = (NSString *)v14;

      v10 = +[NSBundle mainBundle];
      v11 = v10;
      CFStringRef v12 = @"[User Profile Mac Tooltip - Guides]";
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v7 = +[NSBundle mainBundle];
      uint64_t v8 = [v7 localizedStringForKey:@"[User Profile Mac Tooltip - Favorites] favorite" value:@"localized string not found" table:0];
      v9 = v4->_linkTypeStringSingular;
      v4->_linkTypeStringSingular = (NSString *)v8;

      v10 = +[NSBundle mainBundle];
      v11 = v10;
      CFStringRef v12 = @"[User Profile Mac Tooltip - Favorites]";
LABEL_6:
      uint64_t v16 = [v10 localizedStringForKey:v12 value:@"localized string not found" table:0];
      mapsHomeSectionTitlePlural = v4->_mapsHomeSectionTitlePlural;
      v4->_mapsHomeSectionTitlePlural = (NSString *)v16;
    }
  }
  return v4;
}

- (void)viewDidLoad
{
  v91.receiver = self;
  v91.super_class = (Class)MacUserProfileTipViewController;
  [(MacUserProfileTipViewController *)&v91 viewDidLoad];
  v3 = [(MacUserProfileTipViewController *)self view];
  [v3 setAccessibilityIdentifier:@"MacUserProfileTipView"];

  v4 = [(MacUserProfileTipViewController *)self view];
  [v4 setLayoutMargins:16.0, 16.0, 16.0, 16.0];

  id v5 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = +[NSBundle mainBundle];
  CFStringRef v12 = [v11 localizedStringForKey:@"[User Profile Mac Tooltip] Manage <Favorites or Guides>" value:@"localized string not found" table:0];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, self->_mapsHomeSectionTitlePlural);
  [(UILabel *)self->_titleLabel setText:v13];

  uint64_t v14 = +[UIFont system20Bold];
  [(UILabel *)self->_titleLabel setFont:v14];

  v15 = [(MacUserProfileTipViewController *)self view];
  [v15 addSubview:self->_titleLabel];

  uint64_t v16 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height]];
  addLabel = self->_addLabel;
  self->_addLabel = v16;

  [(UILabel *)self->_addLabel setAccessibilityIdentifier:@"AddLabel"];
  [(UILabel *)self->_addLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_addLabel setNumberOfLines:0];
  v18 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_addLabel setTextColor:v18];

  if (self->_userProfileLinkType == 2)
  {
    objc_super v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"[User Profile Mac Tooltip] My Guides" value:@"localized string not found" table:0];
  }
  else
  {
    v20 = self->_mapsHomeSectionTitlePlural;
  }
  v90 = v20;
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"[User Profile Mac Tooltip] To add a <favorite or guide>, hold the pointer and click <plus SF Symbol>", @"localized string not found", 0 value table];
  v89 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, self->_linkTypeStringSingular, v20);

  v23 = +[UIImage systemImageNamed:@"plus.circle.fill"];
  v24 = [(MacUserProfileTipViewController *)self _setupTextString:v89 withImage:v23];
  [(UILabel *)self->_addLabel setAttributedText:v24];

  v25 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody];
  [(UILabel *)self->_addLabel setFont:v25];

  v26 = [(MacUserProfileTipViewController *)self view];
  [v26 addSubview:self->_addLabel];

  v27 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  editLabel = self->_editLabel;
  self->_editLabel = v27;

  [(UILabel *)self->_editLabel setAccessibilityIdentifier:@"EditLabel"];
  [(UILabel *)self->_editLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_editLabel setNumberOfLines:0];
  v29 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_editLabel setTextColor:v29];

  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"[User Profile Mac Tooltip] To edit or remove a <favorite or guide>, hold the pointer over it and click <chevron SF Symbol>", @"localized string not found", 0 value table];
  v88 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, self->_linkTypeStringSingular);

  v32 = +[UIImage systemImageNamed:@"info.circle.fill"];
  v33 = [(MacUserProfileTipViewController *)self _setupTextString:v88 withImage:v32];
  [(UILabel *)self->_editLabel setAttributedText:v33];

  v34 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody];
  [(UILabel *)self->_editLabel setFont:v34];

  v35 = [(MacUserProfileTipViewController *)self view];
  [v35 addSubview:self->_editLabel];

  v86 = [(UILabel *)self->_titleLabel leadingAnchor];
  v87 = [(MacUserProfileTipViewController *)self view];
  v85 = [v87 layoutMarginsGuide];
  v84 = [v85 leadingAnchor];
  v83 = [v86 constraintEqualToAnchor:v84];
  v92[0] = v83;
  v81 = [(UILabel *)self->_titleLabel trailingAnchor];
  v82 = [(MacUserProfileTipViewController *)self view];
  v80 = [v82 layoutMarginsGuide];
  v79 = [v80 trailingAnchor];
  v78 = [v81 constraintEqualToAnchor:v79];
  v92[1] = v78;
  v76 = [(UILabel *)self->_addLabel leadingAnchor];
  v77 = [(MacUserProfileTipViewController *)self view];
  v75 = [v77 layoutMarginsGuide];
  v74 = [v75 leadingAnchor];
  v73 = [v76 constraintEqualToAnchor:v74];
  v92[2] = v73;
  v71 = [(UILabel *)self->_addLabel trailingAnchor];
  v72 = [(MacUserProfileTipViewController *)self view];
  v70 = [v72 layoutMarginsGuide];
  v69 = [v70 trailingAnchor];
  v68 = [v71 constraintEqualToAnchor:v69];
  v92[3] = v68;
  v66 = [(UILabel *)self->_editLabel leadingAnchor];
  v67 = [(MacUserProfileTipViewController *)self view];
  v65 = [v67 layoutMarginsGuide];
  v64 = [v65 leadingAnchor];
  v63 = [v66 constraintEqualToAnchor:v64];
  v92[4] = v63;
  v61 = [(UILabel *)self->_editLabel trailingAnchor];
  v62 = [(MacUserProfileTipViewController *)self view];
  v60 = [v62 layoutMarginsGuide];
  v59 = [v60 trailingAnchor];
  v58 = [v61 constraintEqualToAnchor:v59];
  v92[5] = v58;
  v56 = [(UILabel *)self->_titleLabel topAnchor];
  v57 = [(MacUserProfileTipViewController *)self view];
  v55 = [v57 layoutMarginsGuide];
  v54 = [v55 topAnchor];
  v53 = [v56 constraintEqualToAnchor:v54];
  v92[6] = v53;
  v52 = [(UILabel *)self->_addLabel topAnchor];
  v51 = [(UILabel *)self->_titleLabel bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:6.0];
  v92[7] = v50;
  v36 = [(UILabel *)self->_editLabel topAnchor];
  v37 = [(UILabel *)self->_addLabel bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 constant:16.0];
  v92[8] = v38;
  v39 = [(UILabel *)self->_editLabel bottomAnchor];
  v40 = [(MacUserProfileTipViewController *)self view];
  v41 = [v40 layoutMarginsGuide];
  v42 = [v41 bottomAnchor];
  v43 = [v39 constraintEqualToAnchor:v42];
  v92[9] = v43;
  v44 = +[NSArray arrayWithObjects:v92 count:10];
  +[NSLayoutConstraint activateConstraints:v44];

  v45 = [(MacUserProfileTipViewController *)self view];
  [v45 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v47 = v46;
  double v49 = v48;

  -[MacUserProfileTipViewController setPreferredContentSize:](self, "setPreferredContentSize:", v47, v49);
}

- (id)_setupTextString:(id)a3 withImage:(id)a4
{
  id v5 = a3;
  v6 = [a4 imageWithRenderingMode:2];
  id v7 = objc_alloc_init((Class)NSTextAttachment);
  [v7 setImage:v6];
  id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5 attributes:0];

  v9 = +[NSAttributedString attributedStringWithAttachment:v7];
  [v8 appendAttributedString:v9];

  return v8;
}

- (int64_t)userProfileLinkType
{
  return self->_userProfileLinkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTypeStringSingular, 0);
  objc_storeStrong((id *)&self->_mapsHomeSectionTitlePlural, 0);
  objc_storeStrong((id *)&self->_editLabel, 0);
  objc_storeStrong((id *)&self->_addLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end