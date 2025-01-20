@interface NTKComplicationPickerDetailViewConfiguration
- (NSString)title;
- (NTKComplicationPickerDetailViewConfiguration)initWithDetailListProvider:(id)a3 title:(id)a4;
@end

@implementation NTKComplicationPickerDetailViewConfiguration

- (NTKComplicationPickerDetailViewConfiguration)initWithDetailListProvider:(id)a3 title:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKComplicationPickerDetailViewConfiguration;
  v7 = [(NTKComplicationPickerBaseViewConfiguration *)&v11 initWithListProvider:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    title = v7->_title;
    v7->_title = (NSString *)v8;
  }
  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end