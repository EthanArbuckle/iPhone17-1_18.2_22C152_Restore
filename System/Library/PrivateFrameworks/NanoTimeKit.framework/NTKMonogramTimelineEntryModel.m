@interface NTKMonogramTimelineEntryModel
- (NSString)monogram;
- (id)_newSimpleTextTemplate;
- (id)templateForComplicationFamily:(int64_t)a3;
- (void)setMonogram:(id)a3;
@end

@implementation NTKMonogramTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  id v3 = [(NTKMonogramTimelineEntryModel *)self _newSimpleTextTemplate];
  return v3;
}

- (id)_newSimpleTextTemplate
{
  v2 = (void *)MEMORY[0x1E4F19AB0];
  id v3 = [(NTKMonogramTimelineEntryModel *)self monogram];
  v4 = [v2 textProviderWithText:v3];

  v5 = [MEMORY[0x1E4F199D8] templateWithTextProvider:v4];

  return v5;
}

- (NSString)monogram
{
  return self->_monogram;
}

- (void)setMonogram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end