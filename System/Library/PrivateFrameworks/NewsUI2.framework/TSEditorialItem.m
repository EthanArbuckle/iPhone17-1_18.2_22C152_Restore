@interface TSEditorialItem
- (FCHeadlineProviding)headline;
- (FCTagProviding)backingTag;
- (NSArray)attributes;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)subtitleColor;
- (NSString)title;
- (NSURL)actionURL;
- (TSEditorialItem)init;
- (TSEditorialItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColor:(id)a6 attributes:(id)a7 actionURL:(id)a8 thumbnailImage:(id)a9 backingTag:(id)a10 headline:(id)a11;
- (UIImage)thumbnailImage;
- (void)setActionURL:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setBackingTag:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleColor:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TSEditorialItem

- (NSString)identifier
{
  return (NSString *)sub_1DF1AFAE0();
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_1DF1AFAE0();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSEditorialItem_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitleColor
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSEditorialItem_subtitleColor);
}

- (void)setSubtitleColor:(id)a3
{
}

- (NSArray)attributes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFE200();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAttributes:(id)a3
{
  uint64_t v4 = sub_1DFDFE220();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TSEditorialItem_attributes);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSURL)actionURL
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___TSEditorialItem_actionURL;
  swift_beginAccess();
  sub_1DEAEAE20((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_1DFDE7220();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DFDE7130();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setActionURL:(id)a3
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DFDE7190();
    uint64_t v8 = sub_1DFDE7220();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1DFDE7220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___TSEditorialItem_actionURL;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1DF1B03D0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (UIImage)thumbnailImage
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TSEditorialItem_thumbnailImage);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setThumbnailImage:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TSEditorialItem_thumbnailImage);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (FCTagProviding)backingTag
{
  return (FCTagProviding *)sub_1DF1B07F4();
}

- (void)setBackingTag:(id)a3
{
}

- (FCHeadlineProviding)headline
{
  return (FCHeadlineProviding *)sub_1DF1B07F4();
}

- (void)setHeadline:(id)a3
{
}

- (TSEditorialItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColor:(id)a6 attributes:(id)a7 actionURL:(id)a8 thumbnailImage:(id)a9 backingTag:(id)a10 headline:(id)a11
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v14 - 8);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1DFDFDD20();
  uint64_t v19 = v18;
  uint64_t v20 = sub_1DFDFDD20();
  uint64_t v41 = v21;
  uint64_t v42 = v20;
  if (a5)
  {
    uint64_t v22 = sub_1DFDFDD20();
    uint64_t v39 = v23;
    uint64_t v40 = v22;
    if (a6)
    {
LABEL_3:
      a6 = (id)sub_1DFDFDD20();
      uint64_t v38 = v24;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v38 = 0;
LABEL_6:
  uint64_t v25 = sub_1DFDFE220();
  if (a8)
  {
    sub_1DFDE7190();
    uint64_t v26 = sub_1DFDE7220();
    uint64_t v27 = *(void *)(v26 - 8);
    id v37 = a6;
    uint64_t v28 = v17;
    v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56);
    uint64_t v36 = v25;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v30 = a9;
    v29(v16, 0, 1, v26);
    uint64_t v17 = v28;
    uint64_t v25 = v36;
    a6 = v37;
  }
  else
  {
    uint64_t v31 = sub_1DFDE7220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v16, 1, 1, v31);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v32 = a9;
  }
  v33 = (TSEditorialItem *)sub_1DF1B0F28(v17, v19, v42, v41, v40, v39, (uint64_t)a6, v38, v25, (uint64_t)v16, a9, (uint64_t)a10, (uint64_t)a11);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v33;
}

- (TSEditorialItem)init
{
  result = (TSEditorialItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEB4B7AC((uint64_t)self + OBJC_IVAR___TSEditorialItem_actionURL);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end