@interface _PXStoryMemoryGraphChapter
- (NSDictionary)graphChapterDictionary;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (_PXStoryMemoryGraphChapter)init;
- (void)setGraphChapterDictionary:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation _PXStoryMemoryGraphChapter

- (void).cxx_destruct
{
}

- (void)setLocalizedSubtitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_graphChapterDictionary setObject:v4 forKeyedSubscript:@"subtitle"];
}

- (NSString)localizedSubtitle
{
  return (NSString *)[(NSMutableDictionary *)self->_graphChapterDictionary objectForKeyedSubscript:@"subtitle"];
}

- (void)setLocalizedTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_graphChapterDictionary setObject:v4 forKeyedSubscript:@"title"];
}

- (NSString)localizedTitle
{
  return (NSString *)[(NSMutableDictionary *)self->_graphChapterDictionary objectForKeyedSubscript:@"title"];
}

- (void)setGraphChapterDictionary:(id)a3
{
}

- (NSDictionary)graphChapterDictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_graphChapterDictionary copy];
  return (NSDictionary *)v2;
}

- (_PXStoryMemoryGraphChapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXStoryMemoryGraphChapter;
  v2 = [(_PXStoryMemoryGraphChapter *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    graphChapterDictionary = v2->_graphChapterDictionary;
    v2->_graphChapterDictionary = v3;
  }
  return v2;
}

@end