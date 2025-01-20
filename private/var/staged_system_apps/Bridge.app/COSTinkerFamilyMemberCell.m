@interface COSTinkerFamilyMemberCell
+ (id)nameFormatter;
- (COSTinkerFamilyMemberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation COSTinkerFamilyMemberCell

+ (id)nameFormatter
{
  if (qword_10029B308 != -1) {
    dispatch_once(&qword_10029B308, &stru_100247CF0);
  }
  v2 = (void *)qword_10029B300;

  return v2;
}

- (COSTinkerFamilyMemberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v66.receiver = self;
  v66.super_class = (Class)COSTinkerFamilyMemberCell;
  v4 = [(COSTinkerFamilyMemberCell *)&v66 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    sub_100128B08((uint64_t)v4, v9);

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = BPSTextColor();
    [(UILabel *)v4->_titleLabel setTextColor:v10];

    v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_titleLabel setFont:v11];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    id v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    sub_100128B20((uint64_t)v4, v12);

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = BPSDetailTextColor();
    [(UILabel *)v4->_subtitleLabel setTextColor:v13];

    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v4->_subtitleLabel setFont:v14];

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    id v15 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    sub_100128B38((uint64_t)v4, v15);

    [(UIImageView *)v4->_profilePictureView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_profilePictureView setContentMode:1];
    LODWORD(v16) = 1148846080;
    [(UIImageView *)v4->_profilePictureView setContentHuggingPriority:0 forAxis:v16];
    v17 = [(UIImageView *)v4->_profilePictureView widthAnchor];
    v18 = [v17 constraintEqualToConstant:36.0];
    [v18 setActive:1];

    v19 = v4->_profilePictureView;
    v20 = [(UIImageView *)v19 heightAnchor];
    v21 = [(UIImageView *)v4->_profilePictureView widthAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    self;
    v23 = objc_alloc_init(COSTinkerFamilyBadgeView);
    sub_100128B50((uint64_t)v4, v23);

    [(COSTinkerFamilyBadgeView *)v4->_profileWatchBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [(COSTinkerFamilyBadgeView *)v4->_profileWatchBadgeView widthAnchor];
    v25 = [v24 constraintEqualToConstant:14.0];
    [v25 setActive:1];

    v26 = v4->_profileWatchBadgeView;
    v27 = [(COSTinkerFamilyBadgeView *)v26 heightAnchor];
    v28 = [(COSTinkerFamilyBadgeView *)v4->_profileWatchBadgeView widthAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    [v30 addSubview:v4->_profileWatchBadgeView];

    id v31 = objc_alloc_init((Class)UIStackView);
    [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v31 setAxis:1];
    [v31 setSpacing:2.0];
    [v31 addArrangedSubview:v4->_titleLabel];
    v65 = v31;
    [v31 addArrangedSubview:v4->_subtitleLabel];
    id v32 = objc_alloc((Class)UIStackView);
    v33 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    [v33 bounds];
    id v34 = [v32 initWithFrame:];

    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v34 setAxis:0];
    [v34 setAlignment:1];
    [v34 setSpacing:16.0];
    [v34 addArrangedSubview:v4->_profilePictureView];
    [v34 addArrangedSubview:v31];
    v35 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    [v35 addSubview:v34];

    v63 = [v34 leadingAnchor];
    v64 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    v62 = [v64 leadingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:15.0];
    v67[0] = v61;
    v59 = [v34 trailingAnchor];
    v60 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    v58 = [v60 trailingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:-15.0];
    v67[1] = v57;
    v55 = [v34 topAnchor];
    v56 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    v54 = [v56 topAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:11.0];
    v67[2] = v53;
    v51 = [v34 bottomAnchor];
    v52 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    v50 = [v52 bottomAnchor];
    v49 = [v51 constraintEqualToAnchor:v50 constant:-11.0];
    v67[3] = v49;
    v48 = v4->_profileWatchBadgeView;
    v47 = [(COSTinkerFamilyBadgeView *)v48 trailingAnchor];
    v46 = v4->_profilePictureView;
    v36 = [(UIImageView *)v46 trailingAnchor];
    v37 = [v47 constraintEqualToAnchor:v36 constant:3.0];
    v67[4] = v37;
    v38 = v4->_profileWatchBadgeView;
    v39 = [(COSTinkerFamilyBadgeView *)v38 bottomAnchor];
    v40 = v4->_profilePictureView;
    v41 = [(UIImageView *)v40 bottomAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:2.0];
    v67[5] = v42;
    v43 = +[NSArray arrayWithObjects:v67 count:6];
    +[NSLayoutConstraint activateConstraints:v43];

    v44 = [(COSTinkerFamilyMemberCell *)v4 contentView];
    [v44 bringSubviewToFront:v4->_profileWatchBadgeView];
  }
  return v4;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)COSTinkerFamilyMemberCell;
  [(COSTinkerFamilyMemberCell *)&v7 prepareForReuse];
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  if (self) {
    titleLabel = self->_titleLabel;
  }
  else {
    titleLabel = 0;
  }
  [(UILabel *)titleLabel setFont:v3];

  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  if (self) {
    subtitleLabel = self->_subtitleLabel;
  }
  else {
    subtitleLabel = 0;
  }
  [(UILabel *)subtitleLabel setFont:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileWatchBadgeView, 0);
  objc_storeStrong((id *)&self->_profilePictureView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end