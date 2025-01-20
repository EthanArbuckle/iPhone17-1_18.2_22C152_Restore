@interface WFDynamicTagFieldParameter
- (WFDynamicTagFieldDataSource)dataSource;
- (id)suggestedTags;
- (void)setDataSource:(id)a3;
@end

@implementation WFDynamicTagFieldParameter

- (void).cxx_destruct
{
}

- (void)setDataSource:(id)a3
{
}

- (WFDynamicTagFieldDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WFDynamicTagFieldDataSource *)WeakRetained;
}

- (id)suggestedTags
{
  v3 = [(WFDynamicTagFieldParameter *)self dataSource];
  v4 = [v3 suggestedTagsForTagField:self];

  return v4;
}

@end