@interface CardButton
- (CardButton)initWithConfiguration:(id)a3;
- (CardButton)initWithType:(unint64_t)a3 blurred:(BOOL)a4 tintColor:(id)a5 insets:(UIEdgeInsets)a6 systemImageName:(id)a7 toolTip:(id)a8 hoverBackgroundColor:(id)a9;
- (UIButton)underlyingButton;
- (UIMenu)menu;
- (UIView)viewForVisualAlignment;
- (double)bottomMargin;
- (id)_cardButtonTypeAsString:(unint64_t)a3;
- (unint64_t)type;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)setBottomMargin:(double)a3;
- (void)setMenu:(id)a3;
@end

@implementation CardButton

- (CardButton)initWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  id v6 = [v4 blurred];
  v7 = [v4 tintColor];
  [v4 insets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v4 systemImageName];
  v17 = [v4 toolTip];
  v18 = [v4 hoverBackgroundColor];

  v19 = -[CardButton initWithType:blurred:tintColor:insets:systemImageName:toolTip:hoverBackgroundColor:](self, "initWithType:blurred:tintColor:insets:systemImageName:toolTip:hoverBackgroundColor:", v5, v6, v7, v16, v17, v18, v9, v11, v13, v15);
  return v19;
}

- (CardButton)initWithType:(unint64_t)a3 blurred:(BOOL)a4 tintColor:(id)a5 insets:(UIEdgeInsets)a6 systemImageName:(id)a7 toolTip:(id)a8 hoverBackgroundColor:(id)a9
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  LODWORD(v15) = a4;
  id v18 = a5;
  v19 = (__CFString *)a7;
  v141.receiver = self;
  v141.super_class = (Class)CardButton;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v138 = a8;
  v23 = -[CardButton initWithFrame:](&v141, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v24 = v23;
  v139 = v19;
  id v140 = v18;
  if (v23)
  {
    v23->_type = a3;
    char v135 = v15;
    unint64_t v137 = a3;
    switch(a3)
    {
      case 0uLL:
        v39 = [(CardButton *)v23 traitCollection];
        id v40 = [v39 userInterfaceIdiom];

        if (v40 == (id)5)
        {
          uint64_t v41 = +[UIButton buttonWithType:0];
          actionButton = v24->_actionButton;
          v24->_actionButton = (UIButton *)v41;

          if (v19) {
            CFStringRef v43 = v19;
          }
          else {
            CFStringRef v43 = @"xmark.circle.fill";
          }
          v44 = +[UIImage systemImageNamed:v43];
          v29 = [v44 imageWithRenderingMode:2];

          [(UIButton *)v24->_actionButton setImage:v29 forState:0];
          v45 = v24->_actionButton;
          v46 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:14.0];
          [(UIButton *)v45 setPreferredSymbolConfiguration:v46 forImageInState:0];

          if (v18)
          {
            [(UIButton *)v24->_actionButton setTintColor:v18];
          }
          else
          {
            v121 = +[UIColor secondaryLabelColor];
            [(UIButton *)v24->_actionButton setTintColor:v121];
          }
          id v122 = +[UIColor blackColor];
          id v123 = [v122 CGColor];
          v124 = [(UIButton *)v24->_actionButton layer];
          [v124 setShadowColor:v123];

          v125 = [(UIButton *)v24->_actionButton layer];
          [v125 setShadowOffset:0.0, 0.0];

          v38 = [(UIButton *)v24->_actionButton layer];
          LODWORD(v126) = 0.25;
          [v38 setShadowOpacity:v126];
          goto LABEL_17;
        }
        if (!v15)
        {
          uint64_t v120 = +[UIButton buttonWithType:7];
          v78 = v24->_actionButton;
          v24->_actionButton = (UIButton *)v120;
          goto LABEL_44;
        }
        uint64_t v108 = +[UIButton buttonWithType:0];
        v109 = v24->_actionButton;
        v24->_actionButton = (UIButton *)v108;

        if (v19) {
          CFStringRef v110 = v19;
        }
        else {
          CFStringRef v110 = @"xmark";
        }
        v111 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:15.0];
        v112 = +[UIImage systemImageNamed:v110 withConfiguration:v111];

        v134 = [v112 imageWithRenderingMode:2];

        [(UIButton *)v24->_actionButton setImage:v134 forState:0];
        v113 = v24->_actionButton;
        v114 = +[UIColor whiteColor];
        [(UIButton *)v113 setTintColor:v114];

        v115 = [(UIButton *)v24->_actionButton heightAnchor];
        v116 = [v115 constraintEqualToConstant:20.0];
        v145[0] = v116;
        v117 = [(UIButton *)v24->_actionButton widthAnchor];
        v118 = [v117 constraintEqualToConstant:20.0];
        v145[1] = v118;
        v119 = +[NSArray arrayWithObjects:v145 count:2];
        +[NSLayoutConstraint activateConstraints:v119];

        double top = 24.0;
        double left = 24.0;
        double bottom = 24.0;
        double right = 24.0;
        break;
      case 1uLL:
      case 2uLL:
      case 4uLL:
        if (v19)
        {
          v33 = v19;
        }
        else if (a3 - 1 > 3)
        {
          v33 = 0;
        }
        else
        {
          v33 = off_101315CB0[a3 - 1];
        }
        uint64_t v67 = +[UIButton buttonWithType:0];
        v68 = v24->_actionButton;
        v24->_actionButton = (UIButton *)v67;

        v69 = +[UIImageSymbolConfiguration configurationWithPointSize:15.0];
        v70 = +[UIImage systemImageNamed:v33 withConfiguration:v69];

        v71 = [v70 imageWithRenderingMode:2];

        [(UIButton *)v24->_actionButton setImage:v71 forState:0];
        v131 = v33;
        if (v18)
        {
          [(UIButton *)v24->_actionButton setTintColor:v18];
        }
        else
        {
          v72 = +[UIColor secondaryLabelColor];
          [(UIButton *)v24->_actionButton setTintColor:v72];
        }
        [(UIButton *)v24->_actionButton setAdjustsImageWhenHighlighted:0];
        [(UIButton *)v24->_actionButton setContextMenuInteractionEnabled:1];
        [(UIButton *)v24->_actionButton setShowsMenuAsPrimaryAction:1];
        v73 = [(UIButton *)v24->_actionButton heightAnchor];
        v74 = [v73 constraintEqualToConstant:24.0];
        v144[0] = v74;
        v75 = [(UIButton *)v24->_actionButton widthAnchor];
        v76 = [v75 constraintEqualToConstant:24.0];
        v144[1] = v76;
        v77 = +[NSArray arrayWithObjects:v144 count:2];
        +[NSLayoutConstraint activateConstraints:v77];

        v78 = (UIButton *)v131;
LABEL_44:

        break;
      case 3uLL:
        uint64_t v47 = +[UIButton buttonWithType:7];
        v48 = v24->_actionButton;
        v24->_actionButton = (UIButton *)v47;

        if (v19) {
          CFStringRef v49 = v19;
        }
        else {
          CFStringRef v49 = @"square.and.arrow.up";
        }
        v50 = +[UIImageSymbolConfiguration configurationWithPointSize:15.0];
        v51 = +[UIImage systemImageNamed:v49 withConfiguration:v50];

        v52 = [v51 imageWithRenderingMode:2];

        [(UIButton *)v24->_actionButton setImage:v52 forState:0];
        v53 = +[UIColor secondaryLabelColor];
        [(UIButton *)v24->_actionButton setTintColor:v53];

        goto LABEL_31;
      case 7uLL:
        v54 = [MapsAddButton alloc];
        v52 = +[NSBundle mainBundle];
        v55 = [v52 localizedStringForKey:@"[RouteCreation] Route Library Create" value:@"localized string not found" table:0];
        v56 = [(MapsAddButton *)v54 initWithTitle:v55];
        v57 = v24->_actionButton;
        v24->_actionButton = &v56->super;

LABEL_31:
        break;
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
        v25 = [(CardButton *)v23 traitCollection];
        id v26 = [v25 userInterfaceIdiom];

        if (v26 == (id)5)
        {
          uint64_t v27 = +[UIButton buttonWithType:0];
          v28 = v24->_actionButton;
          v24->_actionButton = (UIButton *)v27;

          v29 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:14.0];
          if (v19)
          {
            CFStringRef v30 = v19;
LABEL_6:
            v31 = +[UIImage systemImageNamed:v30 withConfiguration:v29];
            v32 = [v31 imageWithRenderingMode:2];
LABEL_7:
          }
          else
          {
            switch(v24->_type)
            {
              case 8uLL:
                v31 = +[UIImage _maps_radar_symbolCircleFilled];
                v58 = [v31 imageWithConfiguration:v29];
                v32 = [v58 imageWithRenderingMode:2];

                goto LABEL_7;
              case 9uLL:
                CFStringRef v30 = @"arrow.up.arrow.down";
                goto LABEL_6;
              case 0xAuLL:
                CFStringRef v30 = @"point.forward.to.point.capsulepath.fill";
                goto LABEL_6;
              case 0xBuLL:
                CFStringRef v30 = @"point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill";
                goto LABEL_6;
              default:
                v32 = 0;
                break;
            }
          }
          [(UIButton *)v24->_actionButton setImage:v32 forState:0];
          if (v18)
          {
            [(UIButton *)v24->_actionButton setTintColor:v18];
          }
          else
          {
            v59 = +[UIColor secondaryLabelColor];
            [(UIButton *)v24->_actionButton setTintColor:v59];
          }
          id v60 = +[UIColor blackColor];
          id v61 = [v60 CGColor];
          v62 = [(UIButton *)v24->_actionButton layer];
          [v62 setShadowColor:v61];

          v63 = [(UIButton *)v24->_actionButton layer];
          [v63 setShadowOffset:0.0, 0.0];

          v64 = [(UIButton *)v24->_actionButton layer];
          LODWORD(v65) = 0.25;
          [v64 setShadowOpacity:v65];
        }
        else
        {
          uint64_t v34 = +[UIButton buttonWithType:7];
          v35 = v24->_actionButton;
          v24->_actionButton = (UIButton *)v34;

          v29 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:2 scale:15.0];
          if (v19)
          {
            CFStringRef v36 = v19;
LABEL_14:
            v37 = +[UIImage systemImageNamed:v36 withConfiguration:v29];
            v38 = [v37 imageWithRenderingMode:2];
LABEL_15:
          }
          else
          {
            switch(v24->_type)
            {
              case 8uLL:
                v37 = +[UIImage _maps_radar_symbolFilled];
                v66 = [v37 imageWithConfiguration:v29];
                v38 = [v66 imageWithRenderingMode:2];

                goto LABEL_15;
              case 9uLL:
                CFStringRef v36 = @"arrow.up.arrow.down";
                goto LABEL_14;
              case 0xAuLL:
                CFStringRef v36 = @"point.forward.to.point.capsulepath.fill";
                goto LABEL_14;
              case 0xBuLL:
                CFStringRef v36 = @"point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill";
                goto LABEL_14;
              default:
                v38 = 0;
                break;
            }
          }
          [(UIButton *)v24->_actionButton setImage:v38 forState:0];
LABEL_17:
        }
        break;
      default:
        break;
    }
    [(UIButton *)v24->_actionButton setPointerInteractionEnabled:1];
    [(UIButton *)v24->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v79) = 1148846080;
    [(UIButton *)v24->_actionButton setContentCompressionResistancePriority:0 forAxis:v79];
    LODWORD(v80) = 1148846080;
    [(UIButton *)v24->_actionButton setContentHuggingPriority:0 forAxis:v80];
    LODWORD(v81) = 1148846080;
    [(UIButton *)v24->_actionButton setContentCompressionResistancePriority:1 forAxis:v81];
    LODWORD(v82) = 1148846080;
    [(UIButton *)v24->_actionButton setContentHuggingPriority:1 forAxis:v82];
    double v83 = -bottom;
    double v84 = -right;
    if (sub_1000BBB44(v24) != 5) {
      -[UIButton _setTouchInsets:](v24->_actionButton, "_setTouchInsets:", -top, -left, v83, v84);
    }
    [(CardButton *)v24 addSubview:v24->_actionButton];
    v85 = [(UIButton *)v24->_actionButton bottomAnchor];
    v86 = [(CardButton *)v24 bottomAnchor];
    uint64_t v87 = [v85 constraintEqualToAnchor:v86 constant:v83];
    bottomMarginConstraint = v24->_bottomMarginConstraint;
    v24->_bottomMarginConstraint = (NSLayoutConstraint *)v87;

    v132 = [(UIButton *)v24->_actionButton topAnchor];
    v129 = [(CardButton *)v24 topAnchor];
    v89 = [v132 constraintEqualToAnchor:v129 constant:top];
    v143[0] = v89;
    v90 = [(UIButton *)v24->_actionButton leadingAnchor];
    v91 = [(CardButton *)v24 leadingAnchor];
    v92 = [v90 constraintEqualToAnchor:v91 constant:left];
    v143[1] = v92;
    v93 = [(UIButton *)v24->_actionButton trailingAnchor];
    v94 = [(CardButton *)v24 trailingAnchor];
    v95 = [v93 constraintEqualToAnchor:v94 constant:v84];
    v143[2] = v95;
    v143[3] = v24->_bottomMarginConstraint;
    uint64_t v15 = +[NSArray arrayWithObjects:v143 count:4];
    +[NSLayoutConstraint activateConstraints:v15];

    [(UIButton *)v24->_actionButton sizeToFit];
    [(UIButton *)v24->_actionButton bounds];
    [(UIButton *)v24->_actionButton _setCornerRadius:CGRectGetWidth(v146) * 0.5];
    v19 = v139;
    id v18 = v140;
    a3 = v137;
    LOBYTE(v15) = v135;
  }
  if (v15)
  {
    id v96 = objc_alloc((Class)UIVisualEffectView);
    v97 = +[UIBlurEffect effectWithStyle:16];
    id v98 = [v96 initWithEffect:v97];

    [v98 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v98 _setCornerRadius:14.0];
    [(CardButton *)v24 insertSubview:v98 belowSubview:v24->_actionButton];
    v136 = [v98 centerXAnchor];
    v133 = [(UIButton *)v24->_actionButton centerXAnchor];
    v130 = [v136 constraintEqualToAnchor:v133];
    v142[0] = v130;
    v128 = [v98 centerYAnchor];
    v127 = [(UIButton *)v24->_actionButton centerYAnchor];
    v99 = [v128 constraintEqualToAnchor:v127];
    v142[1] = v99;
    v100 = [v98 heightAnchor];
    v101 = [v100 constraintEqualToConstant:28.0];
    v142[2] = v101;
    v102 = [v98 widthAnchor];
    v103 = [v102 constraintEqualToConstant:28.0];
    v142[3] = v103;
    +[NSArray arrayWithObjects:v142 count:4];
    v105 = unint64_t v104 = a3;
    +[NSLayoutConstraint activateConstraints:v105];

    a3 = v104;
    v19 = v139;

    id v18 = v140;
  }
  [(UIButton *)v24->_actionButton setAccessibilityIdentifier:@"CardButtonActionButton"];
  v106 = [(CardButton *)v24 _cardButtonTypeAsString:a3];
  [(CardButton *)v24 setAccessibilityIdentifier:v106];

  [(UIButton *)v24->_actionButton setToolTip:v138];
  return v24;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
}

- (id)_cardButtonTypeAsString:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return @"CardButtonTypeClose";
  }
  else {
    return *(&off_101315CD0 + a3 - 1);
  }
}

- (UIView)viewForVisualAlignment
{
  return (UIView *)self->_actionButton;
}

- (UIMenu)menu
{
  return [(UIButton *)self->_actionButton menu];
}

- (void)setMenu:(id)a3
{
}

- (double)bottomMargin
{
  [(NSLayoutConstraint *)self->_bottomMarginConstraint constant];
  return result;
}

- (void)setBottomMargin:(double)a3
{
  [(NSLayoutConstraint *)self->_bottomMarginConstraint setConstant:-a3];
  if (sub_1000BBB44(self) != 5)
  {
    [(UIButton *)self->_actionButton _touchInsets];
    actionButton = self->_actionButton;
    -[UIButton _setTouchInsets:](actionButton, "_setTouchInsets:");
  }
}

- (UIButton)underlyingButton
{
  return self->_actionButton;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end