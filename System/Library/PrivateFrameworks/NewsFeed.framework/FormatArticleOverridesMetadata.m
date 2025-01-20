@interface FormatArticleOverridesMetadata
- (FCHeadlineThumbnailMetadata)formatThumbnail;
- (NSDate)displayDate;
- (NSString)shortExcerpt;
- (NSString)storyType;
- (NSString)title;
- (NSURL)routeURL;
- (_TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata)init;
@end

@implementation FormatArticleOverridesMetadata

- (NSString)title
{
  return (NSString *)sub_1BFE0A4F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_title);
}

- (NSString)shortExcerpt
{
  return (NSString *)sub_1BFE0A4F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_shortExcerpt);
}

- (NSURL)routeURL
{
  v3 = (void (*)(uint64_t))MEMORY[0x1E4F276F0];
  sub_1BFE0E1D8(0, (unint64_t *)&qword_1EB8948A0, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v11 - v5;
  sub_1BFE0C1B4((uint64_t)self+ OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_routeURL, (uint64_t)&v11 - v5, (unint64_t *)&qword_1EB8948A0, v3);
  uint64_t v7 = sub_1C1515FDC();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1C1515E9C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSURL *)v9;
}

- (FCHeadlineThumbnailMetadata)formatThumbnail
{
  return (FCHeadlineThumbnailMetadata *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_formatThumbnail));
}

- (NSDate)displayDate
{
  v3 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1BFE0E1D8(0, (unint64_t *)&qword_1EB871180, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v11 - v5;
  sub_1BFE0C1B4((uint64_t)self+ OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_displayDate, (uint64_t)&v11 - v5, (unint64_t *)&qword_1EB871180, v3);
  uint64_t v7 = sub_1C151631C();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1C151621C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSDate *)v9;
}

- (NSString)storyType
{
  return (NSString *)sub_1BFE0A4F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_storyType);
}

- (_TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata)init
{
  result = (_TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_formatThumbnail));
  sub_1BFF516C0((uint64_t)self+ OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_routeURL, (unint64_t *)&qword_1EB8948A0, MEMORY[0x1E4F276F0]);
}

@end