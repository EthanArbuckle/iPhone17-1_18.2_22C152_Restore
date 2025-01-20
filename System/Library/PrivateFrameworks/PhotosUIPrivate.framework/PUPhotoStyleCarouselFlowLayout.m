@interface PUPhotoStyleCarouselFlowLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout)init;
- (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout)initWithCoder:(id)a3;
@end

@implementation PUPhotoStyleCarouselFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x = a4.x;
  double y = a3.y;
  double v6 = a3.x;
  v7 = self;
  sub_1AEB881B8(v6, y, x);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_1AEB88518(x, y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout)init
{
  return (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout *)sub_1AEB887BC();
}

- (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout *)sub_1AEB88814(a3);
}

@end