@interface GQDBGAbstractSlide
- (BOOL)isHidden;
- (char)ID;
- (id)slideStyle;
- (id)stylesheet;
- (int)readAttributesForSlide:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDBGAbstractSlide

- (void)dealloc
{
  mID = self->mID;
  if (mID) {
    xmlFree(mID);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDBGAbstractSlide;
  [(GQDBGAbstractSlide *)&v4 dealloc];
}

- (id)slideStyle
{
  return self->mSlideStyle;
}

- (id)stylesheet
{
  return self->mStylesheet;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (char)ID
{
  return self->mID;
}

- (int)readAttributesForSlide:(_xmlTextReader *)a3
{
  self->mHidden = sub_42DCC(a3, qword_A35F8, (xmlChar *)"hidden", 0);
  self->mID = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16));
  return 1;
}

@end