@interface ICAudioTextAttachment
- (ICAudioTextAttachment)initWithAttachment:(id)a3;
- (ICAudioTextAttachment)initWithCoder:(id)a3;
- (ICAudioTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (NSArray)supportedPresentationSizes;
@end

@implementation ICAudioTextAttachment

- (NSArray)supportedPresentationSizes
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B0B9B380;
  id v4 = objc_allocWithZone(NSNumber);
  v5 = self;
  *(void *)(v3 + 32) = objc_msgSend(v4, sel_initWithShort_, 1);
  sub_1B0B8261C();

  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB56F0);
  v6 = (void *)sub_1B0B825AC();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (ICAudioTextAttachment)initWithAttachment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICAudioTextAttachment;
  return [(ICBaseTextAttachment *)&v4 initWithAttachment:a3];
}

- (ICAudioTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v5 = a3;
  if (a3)
  {
    id v7 = a4;
    id v8 = v5;
    v5 = (void *)sub_1B0B7FC1C();
    unint64_t v10 = v9;

    if (a4)
    {
LABEL_3:
      sub_1B0B8240C();
      uint64_t v12 = v11;

      goto LABEL_6;
    }
  }
  else
  {
    id v13 = a4;
    unint64_t v10 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  if (v10 >> 60 != 15)
  {
    v14 = (void *)sub_1B0B7FC0C();
    if (v12) {
      goto LABEL_8;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v14 = 0;
  if (!v12) {
    goto LABEL_10;
  }
LABEL_8:
  v15 = (void *)sub_1B0B823CC();
  swift_bridgeObjectRelease();
LABEL_11:
  v18.receiver = self;
  v18.super_class = (Class)ICAudioTextAttachment;
  v16 = [(ICTextAttachment *)&v18 initWithData:v14 ofType:v15];
  sub_1B0A8E224((uint64_t)v5, v10);

  return v16;
}

- (ICAudioTextAttachment)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICAudioTextAttachment;
  return [(ICAudioTextAttachment *)&v4 initWithCoder:a3];
}

@end