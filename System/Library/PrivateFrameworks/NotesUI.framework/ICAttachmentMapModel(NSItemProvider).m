@interface ICAttachmentMapModel(NSItemProvider)
- (id)itemProvider;
@end

@implementation ICAttachmentMapModel(NSItemProvider)

- (id)itemProvider
{
  v2 = [a1 MKMapItem];
  v3 = v2;
  if (v2 && [v2 conformsToProtocol:&unk_1F09D7628])
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F0A323C8;
    uint64_t v4 = objc_msgSendSuper2(&v7, sel_itemProvider);
  }
  v5 = (void *)v4;

  return v5;
}

@end