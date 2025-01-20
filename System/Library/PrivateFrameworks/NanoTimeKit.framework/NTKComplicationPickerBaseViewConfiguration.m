@interface NTKComplicationPickerBaseViewConfiguration
- (NTKComplicationPickerBaseViewConfiguration)initWithListProvider:(id)a3;
- (NTKComplicationPickerListProvider)listProvider;
@end

@implementation NTKComplicationPickerBaseViewConfiguration

- (NTKComplicationPickerBaseViewConfiguration)initWithListProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationPickerBaseViewConfiguration;
  v6 = [(NTKComplicationPickerBaseViewConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listProvider, a3);
  }

  return v7;
}

- (NTKComplicationPickerListProvider)listProvider
{
  return self->_listProvider;
}

- (void).cxx_destruct
{
}

@end