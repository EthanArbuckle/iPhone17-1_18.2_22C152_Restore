@interface GQDWPContainerHint
- (CGRect)frame;
- (GQDWPContainerHint)initWithPageIndex:(int64_t)a3 cIndex:(int64_t)a4 sIndex:(int64_t)a5 lIndex:(int64_t)a6 anchorLocation:(int64_t)a7 frame:(CGRect)a8;
- (double)attachmentPosition;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int64_t)anchorLocation;
- (int64_t)cIndex;
- (int64_t)lIndex;
- (int64_t)pageIndex;
- (int64_t)sIndex;
@end

@implementation GQDWPContainerHint

- (GQDWPContainerHint)initWithPageIndex:(int64_t)a3 cIndex:(int64_t)a4 sIndex:(int64_t)a5 lIndex:(int64_t)a6 anchorLocation:(int64_t)a7 frame:(CGRect)a8
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)GQDWPContainerHint;
  result = [(GQDWPContainerHint *)&v18 init];
  if (result)
  {
    result->mPageIndeCGFloat x = a3;
    result->mCIndeCGFloat x = a4;
    result->mSIndeCGFloat x = a5;
    result->mLIndeCGFloat x = a6;
    result->mAnchorLocation = a7;
    result->mAttachmentPosition = 0.0;
    result->mFrame.origin.CGFloat x = x;
    result->mFrame.origin.CGFloat y = y;
    result->mFrame.size.CGFloat width = width;
    result->mFrame.size.CGFloat height = height;
  }
  return result;
}

- (int64_t)pageIndex
{
  return self->mPageIndex;
}

- (int64_t)cIndex
{
  return self->mCIndex;
}

- (int64_t)sIndex
{
  return self->mSIndex;
}

- (int64_t)lIndex
{
  return self->mLIndex;
}

- (int64_t)anchorLocation
{
  return self->mAnchorLocation;
}

- (double)attachmentPosition
{
  return self->mAttachmentPosition;
}

- (CGRect)frame
{
  double x = self->mFrame.origin.x;
  double y = self->mFrame.origin.y;
  double width = self->mFrame.size.width;
  double height = self->mFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  if (!sub_42E14(a3, qword_A35E8, (xmlChar *)"page-index", &self->mPageIndex)
    || !sub_42E14(a3, qword_A35E8, (xmlChar *)"cindex", &self->mCIndex)
    || !sub_42E14(a3, qword_A35E8, (xmlChar *)"sindex", &self->mSIndex)
    || (sub_42E14(a3, qword_A35E8, (xmlChar *)"lindex", &self->mLIndex) & 1) == 0)
  {
    sub_433CC(a3, qword_A35E8, (xmlChar *)"attachment-pos");
    self->mAttachmentPosition = v12;
    return 3;
  }
  int v5 = sub_42E14(a3, qword_A35E8, (xmlChar *)"anchor-loc", &self->mAnchorLocation);
  sub_433CC(a3, qword_A35E8, (xmlChar *)"attachment-pos");
  self->mAttachmentPosition = v6;
  if (!v5) {
    return 3;
  }
  sub_4338C(a3, qword_A35E8, (xmlChar *)"frame-x", &self->mFrame.origin.x);
  if (!v7) {
    return 3;
  }
  sub_4338C(a3, qword_A35E8, (xmlChar *)"frame-y", &self->mFrame.origin.y);
  if (!v8) {
    return 3;
  }
  sub_4338C(a3, qword_A35E8, (xmlChar *)"frame-w", &self->mFrame.size.width);
  int v9 = 3;
  if (v10)
  {
    sub_4338C(a3, qword_A35E8, (xmlChar *)"frame-h", &self->mFrame.size.height);
    if (v11) {
      return 1;
    }
    else {
      return 3;
    }
  }
  return v9;
}

@end