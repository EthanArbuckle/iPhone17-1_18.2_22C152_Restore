@interface RAPPhotoCarouselTableViewCell
- (RAPPhotoCarouselTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UGCPhotoCarouselController)photoCarouselController;
- (void)_setupConstraints;
- (void)setPhotoCarouselController:(id)a3;
@end

@implementation RAPPhotoCarouselTableViewCell

- (RAPPhotoCarouselTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)RAPPhotoCarouselTableViewCell;
  v4 = [(RAPPhotoCarouselTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = -[UGCPhotoCarouselCell initWithFrame:]([UGCPhotoCarouselCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    photoCarouselCell = v4->_photoCarouselCell;
    v4->_photoCarouselCell = v5;

    [(UGCPhotoCarouselCell *)v4->_photoCarouselCell setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UGCPhotoCarouselCell setSectionInset:](v4->_photoCarouselCell, "setSectionInset:", 0.0, 12.0, 0.0, 0.0);
    v7 = [(RAPPhotoCarouselTableViewCell *)v4 contentView];
    [v7 addSubview:v4->_photoCarouselCell];

    [(RAPPhotoCarouselTableViewCell *)v4 _setupConstraints];
    v8 = [(RAPPhotoCarouselTableViewCell *)v4 traitCollection];
    id v9 = [v8 userInterfaceIdiom];

    if (v9 == (id)5)
    {
      v10 = +[UIColor systemBackgroundColor];
      [(RAPPhotoCarouselTableViewCell *)v4 setBackgroundColor:v10];
    }
  }
  return v4;
}

- (void)_setupConstraints
{
  v19 = [(UGCPhotoCarouselCell *)self->_photoCarouselCell topAnchor];
  v20 = [(RAPPhotoCarouselTableViewCell *)self contentView];
  v18 = [v20 topAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v21[0] = v17;
  v15 = [(UGCPhotoCarouselCell *)self->_photoCarouselCell bottomAnchor];
  v16 = [(RAPPhotoCarouselTableViewCell *)self contentView];
  v14 = [v16 bottomAnchor];
  LODWORD(v3) = 1132068864;
  v4 = [v15 constraintEqualToAnchor:v14 constant:-0.0 priority:v3];
  v21[1] = v4;
  v5 = [(UGCPhotoCarouselCell *)self->_photoCarouselCell leadingAnchor];
  v6 = [(RAPPhotoCarouselTableViewCell *)self contentView];
  v7 = [v6 leadingAnchor];
  v8 = [v5 constraintEqualToAnchor:v7 constant:0.0];
  v21[2] = v8;
  id v9 = [(UGCPhotoCarouselCell *)self->_photoCarouselCell trailingAnchor];
  v10 = [(RAPPhotoCarouselTableViewCell *)self contentView];
  v11 = [v10 trailingAnchor];
  objc_super v12 = [v9 constraintEqualToAnchor:v11 constant:-0.0];
  v21[3] = v12;
  v13 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)setPhotoCarouselController:(id)a3
{
  id v6 = a3;
  id v4 = [(UGCPhotoCarouselCell *)self->_photoCarouselCell carouselController];

  v5 = v6;
  if (v4 != v6)
  {
    [(UGCPhotoCarouselCell *)self->_photoCarouselCell setCarouselController:v6];
    v5 = v6;
  }
}

- (UGCPhotoCarouselController)photoCarouselController
{
  return [(UGCPhotoCarouselCell *)self->_photoCarouselCell carouselController];
}

- (void).cxx_destruct
{
}

@end