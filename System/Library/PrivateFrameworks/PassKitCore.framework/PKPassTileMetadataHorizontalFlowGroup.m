@interface PKPassTileMetadataHorizontalFlowGroup
+ (BOOL)supportsSecureCoding;
+ (id)_createDefaultDashboardGroupMetadata;
- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4;
- (PKPassTileMetadataHorizontalFlowGroup)initWithCoder:(id)a3;
- (int64_t)heightClass;
- (int64_t)widthClass;
- (unint64_t)columns;
- (unint64_t)groupStyle;
- (unint64_t)maximumRows;
- (void)encodeWithCoder:(id)a3;
- (void)setColumns:(unint64_t)a3;
- (void)setGroupStyle:(unint64_t)a3;
- (void)setHeightClass:(int64_t)a3;
- (void)setMaximumRows:(unint64_t)a3;
- (void)setWidthClass:(int64_t)a3;
@end

@implementation PKPassTileMetadataHorizontalFlowGroup

+ (id)_createDefaultDashboardGroupMetadata
{
  id v2 = +[PKPassTileMetadata _createMetadataForType:2 identifier:@"__defaultGroupIdentifier__" context:1];
  v3 = [v2 metadataTypeHorizontalFlowGroup];

  [v3 setColumns:2];
  [v3 setMaximumRows:2];
  [v3 setWidthClass:2];
  [v3 setHeightClass:1];
  return v3;
}

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPassTileMetadataHorizontalFlowGroup;
  if ([(PKPassTileMetadata *)&v21 _setUpWithDictionary:v6 privateDictionary:a4])
  {
    v7 = [v6 PKNumberForKey:@"columns"];
    if ([v7 pk_isPositiveNumber]
      && ([v7 pk_isIntegralNumber] & 1) != 0)
    {
      self->_columns = [v7 unsignedIntegerValue];
      v8 = [v6 PKNumberForKey:@"maximumRows"];
      v9 = v8;
      if (!v8
        || [v8 pk_isPositiveNumber]
        && ([v9 pk_isIntegralNumber] & 1) != 0)
      {
        self->_maximumRows = [v9 unsignedIntegerValue];
        v10 = [v6 PKStringForKey:@"widthClass"];
        int64_t v11 = PKPassTileWidthClassHorizontalFlowFromString(v10);
        self->_widthClass = v11;
        if (v11)
        {
          v12 = [v6 PKStringForKey:@"heightClass"];
          int64_t v13 = PKPassTileHeightClassFromString(v12);
          self->_heightClass = v13;
          BOOL v14 = v13 != 0;
          if (v13)
          {
            v15 = [v6 PKStringForKey:@"groupStyle"];
            self->_groupStyle = PKPassTileGroupStyleFromString(v15);
          }
          else
          {
            v15 = PKLogFacilityTypeGetObject(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v19 = [(PKPassTileMetadata *)self identifier];
              *(_DWORD *)buf = 138412546;
              v23 = v19;
              __int16 v24 = 2112;
              v25 = v12;
              _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - unrecognized height class: %@.", buf, 0x16u);
            }
          }
        }
        else
        {
          v12 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [(PKPassTileMetadata *)self identifier];
            *(_DWORD *)buf = 138412546;
            v23 = v18;
            __int16 v24 = 2112;
            v25 = v10;
            _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - unrecognized width class: %@.", buf, 0x16u);
          }
          BOOL v14 = 0;
        }
      }
      else
      {
        v10 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(PKPassTileMetadata *)self identifier];
          *(_DWORD *)buf = 138412546;
          v23 = v17;
          __int16 v24 = 2112;
          v25 = v9;
          _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - invalid value for maximumRows: %@.", buf, 0x16u);
        }
        BOOL v14 = 0;
      }
    }
    else
    {
      v9 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(PKPassTileMetadata *)self identifier];
        *(_DWORD *)buf = 138412546;
        v23 = v16;
        __int16 v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - invalid value for columns: %@.", buf, 0x16u);
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadataHorizontalFlowGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassTileMetadataHorizontalFlowGroup;
  v5 = [(PKPassTileMetadata *)&v12 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"columns"];
    v5->_columns = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumRows"];
    v5->_maximumRows = [v7 unsignedIntegerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widthClass"];
    v5->_widthClass = PKPassTileWidthClassHorizontalFlowFromString(v8);

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heightClass"];
    v5->_heightClass = PKPassTileHeightClassFromString(v9);

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupStyle"];
    v5->_groupStyle = PKPassTileGroupStyleFromString(v10);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPassTileMetadataHorizontalFlowGroup;
  id v4 = a3;
  [(PKPassTileMetadata *)&v12 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_columns, v12.receiver, v12.super_class);
  [v4 encodeObject:v5 forKey:@"columns"];

  id v6 = [NSNumber numberWithUnsignedInteger:self->_maximumRows];
  [v4 encodeObject:v6 forKey:@"maximumRows"];

  int64_t widthClass = self->_widthClass;
  v8 = @"default";
  if (widthClass != 1) {
    v8 = 0;
  }
  if (widthClass == 2) {
    v9 = @"compact";
  }
  else {
    v9 = v8;
  }
  [v4 encodeObject:v9 forKey:@"widthClass"];
  v10 = PKPassTileHeightClassToString(self->_heightClass);
  [v4 encodeObject:v10 forKey:@"heightClass"];

  int64_t v11 = PKPassTileGroupStyleToString(self->_groupStyle);
  [v4 encodeObject:v11 forKey:@"groupStyle"];
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (unint64_t)maximumRows
{
  return self->_maximumRows;
}

- (void)setMaximumRows:(unint64_t)a3
{
  self->_maximumRows = a3;
}

- (int64_t)widthClass
{
  return self->_widthClass;
}

- (void)setWidthClass:(int64_t)a3
{
  self->_int64_t widthClass = a3;
}

- (int64_t)heightClass
{
  return self->_heightClass;
}

- (void)setHeightClass:(int64_t)a3
{
  self->_heightClass = a3;
}

- (unint64_t)groupStyle
{
  return self->_groupStyle;
}

- (void)setGroupStyle:(unint64_t)a3
{
  self->_groupStyle = a3;
}

@end