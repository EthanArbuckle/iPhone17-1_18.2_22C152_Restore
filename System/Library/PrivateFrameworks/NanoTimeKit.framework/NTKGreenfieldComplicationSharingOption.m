@interface NTKGreenfieldComplicationSharingOption
+ (id)optionWithName:(id)a3 uniqueIdentifier:(id)a4 optionType:(unint64_t)a5;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (unint64_t)optionType;
@end

@implementation NTKGreenfieldComplicationSharingOption

+ (id)optionWithName:(id)a3 uniqueIdentifier:(id)a4 optionType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(NTKGreenfieldComplicationSharingOption);
  uint64_t v10 = [v8 copy];

  name = v9->_name;
  v9->_name = (NSString *)v10;

  uint64_t v12 = [v7 copy];
  uniqueIdentifier = v9->_uniqueIdentifier;
  v9->_uniqueIdentifier = (NSString *)v12;

  v9->_optionType = a5;
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)optionType
{
  return self->_optionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end