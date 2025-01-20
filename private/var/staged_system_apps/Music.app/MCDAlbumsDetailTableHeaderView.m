@interface MCDAlbumsDetailTableHeaderView
+ (id)reuseIdentifier;
- (BOOL)contentPlayable;
- (BOOL)isFavorite;
- (MCDAlbumsDetailTableHeaderView)initWithReuseIdentifier:(id)a3;
- (NSString)title;
- (UIImage)artworkImage;
- (id)shuffleActionBlock;
- (void)_shuffleButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)setArtworkImage:(id)a3;
- (void)setContentPlayable:(BOOL)a3;
- (void)setDuration:(double)a3 count:(unint64_t)a4;
- (void)setFavorite:(BOOL)a3;
- (void)setShuffleActionBlock:(id)a3;
- (void)setTemplateArtworkImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MCDAlbumsDetailTableHeaderView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (MCDAlbumsDetailTableHeaderView)initWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MCDAlbumsDetailTableHeaderView;
  v5 = [(MCDAlbumsDetailTableHeaderView *)&v35 initWithReuseIdentifier:v4];
  if (v5)
  {
    id v6 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    artworkImageView = v5->_artworkImageView;
    v5->_artworkImageView = v10;

    [(UIImageView *)v5->_artworkImageView setContentMode:1];
    v12 = [(MCDAlbumsDetailTableHeaderView *)v5 contentView];
    [v12 addSubview:v5->_artworkImageView];

    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v13;

    v15 = +[UIFont boldSystemFontOfSize:16.0];
    [(UILabel *)v5->_titleLabel setFont:v15];

    v16 = +[UIColor _carSystemPrimaryColor];
    [(UILabel *)v5->_titleLabel setTextColor:v16];

    v17 = +[UIColor _carSystemFocusPrimaryColor];
    [(UILabel *)v5->_titleLabel setHighlightedTextColor:v17];

    v18 = [(MCDAlbumsDetailTableHeaderView *)v5 contentView];
    [v18 addSubview:v5->_titleLabel];

    v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v19;

    v21 = +[UIColor _carSystemSecondaryColor];
    [(UILabel *)v5->_subtitleLabel setTextColor:v21];

    v22 = +[UIColor _carSystemFocusSecondaryColor];
    [(UILabel *)v5->_subtitleLabel setHighlightedTextColor:v22];

    v23 = [(MCDAlbumsDetailTableHeaderView *)v5 contentView];
    [v23 addSubview:v5->_subtitleLabel];

    uint64_t v24 = objc_opt_new();
    shuffleButton = v5->_shuffleButton;
    v5->_shuffleButton = (CPUIMediaButton *)v24;

    v26 = +[UIImage _systemImageNamed:@"shuffle"];
    [(CPUIMediaButton *)v5->_shuffleButton setImage:v26 forState:0];
    [(CPUIMediaButton *)v5->_shuffleButton addTarget:v5 action:"_shuffleButtonAction:" forControlEvents:64];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v27 = (void (*)(void))off_1010D6F08;
    v44 = off_1010D6F08;
    if (!off_1010D6F08)
    {
      v36 = _NSConcreteStackBlock;
      uint64_t v37 = 3221225472;
      v38 = sub_1000A2004;
      v39 = &unk_100FC34A0;
      v40 = &v41;
      v28 = (void *)sub_100029D70();
      v29 = dlsym(v28, "MCDCarDisplayBundle");
      *(void *)(v40[1] + 24) = v29;
      off_1010D6F08 = *(_UNKNOWN **)(v40[1] + 24);
      v27 = (void (*)(void))v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (!v27)
    {
      sub_100D691B8();
      __break(1u);
    }
    v30 = v27();
    v31 = [v30 localizedStringForKey:@"ACCESSIBILITY_SHUFFLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v45 = v31;
    v32 = +[NSArray arrayWithObjects:&v45 count:1];
    [(CPUIMediaButton *)v5->_shuffleButton setAccessibilityUserInputLabels:v32];

    v33 = [(MCDAlbumsDetailTableHeaderView *)v5 contentView];
    [v33 addSubview:v5->_shuffleButton];
  }
  return v5;
}

- (void)layoutSubviews
{
  v98.receiver = self;
  v98.super_class = (Class)MCDAlbumsDetailTableHeaderView;
  [(MCDAlbumsDetailTableHeaderView *)&v98 layoutSubviews];
  v3 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  artworkImageView = self->_artworkImageView;
  v13 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
  [(UIImageView *)artworkImageView setFrame:sub_1000B4E80(v13, 0.0, 4.0, 36.0, 36.0)];

  v14 = self->_artworkImageView;
  v15 = [(UIImageView *)v14 image];
  [(UIImageView *)v14 setHidden:v15 == 0];

  UIRectCenteredYInRect();
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v92 = v5;
  v108.origin.CGFloat x = v5;
  v108.origin.CGFloat y = v7;
  CGFloat rect = v9;
  v108.size.double width = v9;
  v108.size.double height = v11;
  double Width = CGRectGetWidth(v108);
  v109.origin.CGFloat x = v17;
  v109.origin.CGFloat y = v19;
  v109.size.double width = v21;
  v109.size.double height = v23;
  double v25 = Width - CGRectGetWidth(v109);
  v26 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
  [(CPUIMediaButton *)self->_shuffleButton setFrame:sub_1000B4E80(v26, v25, v19, v21, v23)];

  v27 = [(UIImageView *)self->_artworkImageView image];

  if (v27)
  {
    v110.origin.CGFloat x = 0.0;
    v110.origin.CGFloat y = 4.0;
    v110.size.double width = 36.0;
    v110.size.double height = 36.0;
    double v28 = CGRectGetMaxX(v110) + 9.0;
    v111.origin.CGFloat x = v5;
    v111.size.double height = v11;
    v111.origin.CGFloat y = v7;
    v111.size.double width = rect;
    CGFloat MinY = CGRectGetMinY(v111);
    v112.origin.CGFloat x = v25;
    v112.origin.CGFloat y = v19;
    v112.size.double width = v21;
    v112.size.double height = v23;
    double MinX = CGRectGetMinX(v112);
    v113.origin.CGFloat x = 0.0;
    v113.origin.CGFloat y = 4.0;
    v113.size.double width = 36.0;
    v113.size.double height = 36.0;
    double v31 = MinX - CGRectGetMaxX(v113) + -18.0;
  }
  else
  {
    v114.origin.CGFloat x = v5;
    v114.size.double height = v11;
    v114.origin.CGFloat y = v7;
    v114.size.double width = rect;
    CGFloat MinY = CGRectGetMinY(v114);
    v115.origin.CGFloat x = v25;
    v115.origin.CGFloat y = v19;
    v115.size.double width = v21;
    v115.size.double height = v23;
    double v31 = CGRectGetMinX(v115) + -9.0;
    double v28 = 0.0;
  }
  v116.origin.CGFloat x = v92;
  v116.size.double height = v11;
  v116.origin.CGFloat y = v7;
  v116.size.double width = rect;
  CGFloat Height = CGRectGetHeight(v116);
  v117.origin.CGFloat x = v28;
  v117.origin.CGFloat y = MinY;
  v117.size.double width = v31;
  v117.size.double height = Height;
  CGFloat v91 = CGRectGetMinX(v117);
  double v33 = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGSizeZero.width, v33);
  v118.size.double width = v34;
  v118.size.double height = v35;
  CGFloat v90 = v35;
  v118.origin.CGFloat y = 0.0;
  v118.origin.CGFloat x = v91;
  double v36 = CGRectGetWidth(v118);
  v119.origin.CGFloat x = v28;
  v119.origin.CGFloat y = MinY;
  v119.size.double width = v31;
  v119.size.double height = Height;
  double v37 = CGRectGetWidth(v119);
  if (v36 >= v37) {
    CGFloat v38 = v37;
  }
  else {
    CGFloat v38 = v36;
  }
  v120.origin.CGFloat x = v28;
  v120.origin.CGFloat y = MinY;
  v120.size.double width = v31;
  v120.size.double height = Height;
  CGFloat v39 = CGRectGetMinX(v120);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGSizeZero.width, v33);
  v121.size.double width = v40;
  CGFloat v42 = v41;
  v121.origin.CGFloat y = 0.0;
  v121.origin.CGFloat x = v39;
  v121.size.double height = v42;
  double v43 = CGRectGetWidth(v121);
  v122.origin.CGFloat x = v28;
  v122.origin.CGFloat y = MinY;
  v122.size.double width = v31;
  v122.size.double height = Height;
  double v44 = CGRectGetWidth(v122);
  if (v43 >= v44) {
    double v43 = v44;
  }
  v123.origin.CGFloat y = 0.0;
  v123.size.double height = v90;
  v123.origin.CGFloat x = v91;
  double v88 = v38;
  v123.size.double width = v38;
  CGRectGetHeight(v123);
  v124.origin.CGFloat y = 0.0;
  v124.origin.CGFloat x = v39;
  v124.size.double width = v43;
  v124.size.double height = v42;
  CGRectGetHeight(v124);
  UIRectCenteredYInRect();
  CGFloat x = v125.origin.x;
  CGFloat y = v125.origin.y;
  CGFloat v47 = v125.size.width;
  CGFloat v48 = v125.size.height;
  CGFloat recta = CGRectGetMinY(v125);
  v126.origin.CGFloat x = x;
  v126.origin.CGFloat y = y;
  double v49 = v42;
  CGFloat v50 = v39;
  double v93 = v47;
  v126.size.double width = v47;
  CGFloat v51 = v49;
  v126.size.double height = v48;
  CGFloat v52 = v43;
  double MaxY = CGRectGetMaxY(v126);
  v127.origin.CGFloat y = 0.0;
  v127.origin.CGFloat x = v39;
  v127.size.double width = v43;
  v127.size.double height = v51;
  CGFloat v54 = CGRectGetHeight(v127);
  unsigned int v55 = [(MCDAlbumsDetailTableHeaderView *)self isFavorite];
  favoriteIcon = self->_favoriteIcon;
  double v94 = v54;
  if (v55)
  {
    CGFloat v57 = v90;
    double v86 = v51;
    double v87 = v39;
    double v89 = MaxY;
    if (favoriteIcon)
    {
      [(UIImageView *)favoriteIcon setHidden:0];
      CGFloat v58 = v91;
      CGFloat v59 = recta;
    }
    else
    {
      uint64_t v104 = 0;
      v105 = &v104;
      uint64_t v106 = 0x2020000000;
      v63 = (void (*)(void))off_1010D6F18;
      v107 = off_1010D6F18;
      CGFloat v58 = v91;
      CGFloat v59 = recta;
      if (!off_1010D6F18)
      {
        v99 = _NSConcreteStackBlock;
        uint64_t v100 = 3221225472;
        v101 = sub_1000A20C8;
        v102 = &unk_100FC34A0;
        v103 = &v104;
        v64 = (void *)sub_100029D70();
        v65 = dlsym(v64, "MCDFavoriteIcon");
        *(void *)(v103[1] + 24) = v65;
        off_1010D6F18 = *(_UNKNOWN **)(v103[1] + 24);
        v63 = (void (*)(void))v105[3];
      }
      _Block_object_dispose(&v104, 8);
      if (!v63)
      {
        v84 = (_Unwind_Exception *)sub_100D691B8();
        _Block_object_dispose(&v104, 8);
        _Unwind_Resume(v84);
      }
      v63();
      v66 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v67 = self->_favoriteIcon;
      self->_favoriteIcon = v66;

      v68 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
      [v68 addSubview:self->_favoriteIcon];
    }
    double v69 = v88;
    [(UIImageView *)self->_favoriteIcon bounds];
    double v71 = v88 + 4.0 + v70;
    double v85 = v52;
    if (v71 >= v93)
    {
      [(UIImageView *)self->_favoriteIcon bounds];
      double v69 = v88 - (v72 + 4.0);
    }
    [(UIImageView *)self->_favoriteIcon frame];
    CGFloat rectb = v73;
    CGFloat v75 = v74;
    CGFloat v77 = v76;
    v128.origin.CGFloat x = v58;
    v128.origin.CGFloat y = v59;
    v128.size.double width = v69;
    v128.size.double height = v90;
    CGFloat v62 = v59;
    CGFloat v60 = v58;
    CGFloat v61 = v69;
    CGFloat v78 = CGRectGetMaxX(v128) + 4.0;
    v129.origin.CGFloat x = v60;
    v129.origin.CGFloat y = v62;
    v129.size.double width = v61;
    v129.size.double height = v90;
    double MidY = CGRectGetMidY(v129);
    v130.origin.CGFloat x = v78;
    v130.origin.CGFloat y = rectb;
    v130.size.double width = v75;
    v130.size.double height = v77;
    CGFloat v80 = MidY + CGRectGetHeight(v130) * -0.5;
    v81 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
    [(UIImageView *)self->_favoriteIcon setFrame:sub_1000B4E80(v81, v78, v80, v75, v77)];

    CGFloat v51 = v86;
    CGFloat v50 = v87;
    CGFloat v52 = v85;
    double MaxY = v89;
  }
  else
  {
    [(UIImageView *)favoriteIcon setHidden:1];
    CGFloat v57 = v90;
    CGFloat v60 = v91;
    CGFloat v61 = v88;
    CGFloat v62 = recta;
  }
  v82 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
  [(UILabel *)self->_titleLabel setFrame:sub_1000B4E80(v82, v60, v62, v61, v57)];

  v83 = [(MCDAlbumsDetailTableHeaderView *)self contentView];
  [(UILabel *)self->_subtitleLabel setFrame:sub_1000B4E80(v83, v50, MaxY - v94, v52, v51)];
}

- (UIImage)artworkImage
{
  return [(UIImageView *)self->_artworkImageView image];
}

- (void)setArtworkImage:(id)a3
{
  id v7 = a3;
  id v4 = [(MCDAlbumsDetailTableHeaderView *)self artworkImage];

  if (v4 != v7)
  {
    [(UIImageView *)self->_artworkImageView setImage:v7];
    [(UIImageView *)self->_artworkImageView setTintColor:0];
    [(UIImageView *)self->_artworkImageView setClipsToBounds:1];
    id v5 = [v7 renderingMode];
    double v6 = 4.5;
    if (v5 == (id)2) {
      double v6 = 0.0;
    }
    [(UIImageView *)self->_artworkImageView _setContinuousCornerRadius:v6];
    [(MCDAlbumsDetailTableHeaderView *)self setNeedsLayout];
  }
}

- (void)setTemplateArtworkImage:(id)a3
{
  [(MCDAlbumsDetailTableHeaderView *)self setArtworkImage:a3];
  id v4 = +[UIColor _carSystemSecondaryColor];
  [(UIImageView *)self->_artworkImageView setTintColor:v4];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(MCDAlbumsDetailTableHeaderView *)self title];
  unsigned __int8 v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_titleLabel setText:v6];
  }
}

- (void)setContentPlayable:(BOOL)a3
{
  self->_contentPlayable = a3;
  [(CPUIMediaButton *)self->_shuffleButton setHidden:!a3];
}

- (void)setDuration:(double)a3 count:(unint64_t)a4
{
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v7 = (void (*)(unint64_t, unint64_t))off_1010D6F20;
  double v22 = off_1010D6F20;
  if (!off_1010D6F20)
  {
    double v8 = (void *)sub_100029D70();
    v20[3] = (uint64_t)dlsym(v8, "MCDAlbumDetailFormat");
    off_1010D6F20 = (_UNKNOWN *)v20[3];
    id v7 = (void (*)(unint64_t, unint64_t))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v7)
  {
    sub_100D691B8();
    __break(1u);
  }
  CGFloat v9 = v7(a4, llround(a3 / 60.0));
  NSAttributedStringKey v27 = NSFontAttributeName;
  double v10 = +[UIFont systemFontOfSize:12.0];
  double v28 = v10;
  CGFloat v11 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  NSAttributedStringKey v25 = NSFontAttributeName;
  v12 = +[UIFont boldSystemFontOfSize:12.0];
  v26 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v14 = +[MPUEmphasizedText attributedStringWithString:v9 emphasisDelimiter:@"#" regularTextAttributes:v11 emphasizedTextAttributes:v13];
  id v15 = [v14 mutableCopy];

  double v16 = +[NSParagraphStyle defaultParagraphStyle];
  id v17 = [v16 mutableCopy];

  [v17 setLineBreakMode:4];
  NSAttributedStringKey v23 = NSParagraphStyleAttributeName;
  id v24 = v17;
  double v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [v15 addAttributes:v18 range:NSMakeRange(0, [v15 length])];

  [(UILabel *)self->_subtitleLabel setAttributedText:v15];
}

- (void)_shuffleButtonAction:(id)a3
{
  id v6 = a3;
  id v4 = [(MCDAlbumsDetailTableHeaderView *)self shuffleActionBlock];

  if (v4)
  {
    unsigned __int8 v5 = [(MCDAlbumsDetailTableHeaderView *)self shuffleActionBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)contentPlayable
{
  return self->_contentPlayable;
}

- (id)shuffleActionBlock
{
  return self->_shuffleActionBlock;
}

- (void)setShuffleActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shuffleActionBlock, 0);
  objc_storeStrong((id *)&self->_shuffleButton, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_artworkImageView, 0);
}

@end