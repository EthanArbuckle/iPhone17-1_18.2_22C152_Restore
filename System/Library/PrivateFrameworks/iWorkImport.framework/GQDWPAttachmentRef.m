@interface GQDWPAttachmentRef
- (GQDWPAttachmentRef)initWithUID:(char *)a3 root:(id)a4;
- (id)drawable;
- (void)dealloc;
@end

@implementation GQDWPAttachmentRef

- (GQDWPAttachmentRef)initWithUID:(char *)a3 root:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GQDWPAttachmentRef;
  v6 = [(GQDWPAttachmentRef *)&v8 init];
  if (v6)
  {
    v6->mUID = (char *)xmlStrdup((const xmlChar *)a3);
    v6->mRoot = (GQDRoot *)a4;
  }
  return v6;
}

- (void)dealloc
{
  mUID = self->mUID;
  if (mUID) {
    xmlFree(mUID);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPAttachmentRef;
  [(GQDWPAttachment *)&v4 dealloc];
}

- (id)drawable
{
  id result = self->super.mDrawable;
  if (!result)
  {
    id result = objc_msgSend(-[GQDRoot objectWithXmlUid:](self->mRoot, "objectWithXmlUid:", self->mUID), "drawable");
    self->super.mDrawable = (GQDDrawable *)result;
  }
  return result;
}

@end