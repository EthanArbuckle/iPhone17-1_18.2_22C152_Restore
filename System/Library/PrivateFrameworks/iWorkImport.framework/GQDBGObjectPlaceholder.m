@interface GQDBGObjectPlaceholder
+ (const)stateForReading;
- (id)drawable;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDBGObjectPlaceholder

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9DE78;
}

- (void)dealloc
{
  mContentType = self->mContentType;
  if (mContentType) {
    xmlFree(mContentType);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDBGObjectPlaceholder;
  [(GQDBGPlaceholder *)&v4 dealloc];
}

- (id)drawable
{
  return self->mDrawable;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  self->mContentType = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"content-type", *(const xmlChar **)(qword_A35F8 + 16));
  return 1;
}

@end