@interface PUPhotoPickerRemoteContainerView
- (void)setFrame:(CGRect)a3;
@end

@implementation PUPhotoPickerRemoteContainerView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUPhotoPickerRemoteContainerView *)self frame];
  double v8 = v14.origin.x;
  double v9 = v14.origin.y;
  double v10 = v14.size.width;
  double v11 = v14.size.height;
  if (CGRectIsEmpty(v14)
    || (v15.origin.x = x, v15.origin.y = y, v15.size.width = width, v15.size.double height = height, !CGRectIsEmpty(v15)))
  {
    -[PUPhotoPickerRemoteContainerView setFrame:](&v12, sel_setFrame_, x, y, width, height, self, PUPhotoPickerRemoteContainerView, v13.receiver, v13.super_class);
  }
  else
  {
    -[PUPhotoPickerRemoteContainerView setFrame:](&v13, sel_setFrame_, v8, v9, v10, v11, v12.receiver, v12.super_class, self, PUPhotoPickerRemoteContainerView);
  }
}

@end