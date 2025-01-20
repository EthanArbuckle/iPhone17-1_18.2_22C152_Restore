@interface PXStoryStyleConfigurationList
- (BOOL)isEqual:(id)a3;
- (NSArray)autoEditStyleConfigurations;
- (PXStoryStyleConfiguration)initialStyleConfiguration;
- (PXStoryStyleConfigurationList)init;
- (PXStoryStyleConfigurationList)initWithAutoEditStyleConfigurations:(id)a3 initialStyleConfiguration:(id)a4;
- (unint64_t)hash;
@end

@implementation PXStoryStyleConfigurationList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_autoEditStyleConfigurations, 0);
}

- (PXStoryStyleConfiguration)initialStyleConfiguration
{
  return self->_initialStyleConfiguration;
}

- (NSArray)autoEditStyleConfigurations
{
  return self->_autoEditStyleConfigurations;
}

- (unint64_t)hash
{
  v3 = [(PXStoryStyleConfigurationList *)self autoEditStyleConfigurations];
  uint64_t v4 = [v3 hash];

  v5 = [(PXStoryStyleConfigurationList *)self initialStyleConfiguration];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStoryStyleConfigurationList *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXStoryStyleConfigurationList *)self autoEditStyleConfigurations];
      id v7 = [(PXStoryStyleConfigurationList *)v5 autoEditStyleConfigurations];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v10 = [(PXStoryStyleConfigurationList *)self initialStyleConfiguration];
      v11 = [(PXStoryStyleConfigurationList *)v5 initialStyleConfiguration];
      if (v10 == v11) {
        char v9 = 1;
      }
      else {
        char v9 = [v10 isEqual:v11];
      }

      goto LABEL_13;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (PXStoryStyleConfigurationList)initWithAutoEditStyleConfigurations:(id)a3 initialStyleConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryStyleConfigurationList;
  int v8 = [(PXStoryStyleConfigurationList *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    autoEditStyleConfigurations = v8->_autoEditStyleConfigurations;
    v8->_autoEditStyleConfigurations = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_initialStyleConfiguration, a4);
  }

  return v8;
}

- (PXStoryStyleConfigurationList)init
{
  return [(PXStoryStyleConfigurationList *)self initWithAutoEditStyleConfigurations:MEMORY[0x1E4F1CBF0] initialStyleConfiguration:0];
}

@end