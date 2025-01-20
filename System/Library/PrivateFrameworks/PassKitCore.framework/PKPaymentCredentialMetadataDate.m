@interface PKPaymentCredentialMetadataDate
- (BOOL)_isEqualToMetadata:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)displayFormat;
- (PKPaymentCredentialMetadataDate)initWithConfiguration:(id)a3;
- (id)displayString;
- (unint64_t)hash;
@end

@implementation PKPaymentCredentialMetadataDate

- (PKPaymentCredentialMetadataDate)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentCredentialMetadataDate;
  v5 = [(PKPaymentCredentialMetadata *)&v11 initWithConfiguration:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"displayFormat"];
    displayFormat = v5->_displayFormat;
    v5->_displayFormat = (NSString *)v6;

    if (!v5->_displayFormat)
    {

      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "No Display format in configuration could not create metadata", v10, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (id)displayString
{
  if (qword_1EB402EC0 != -1) {
    dispatch_once(&qword_1EB402EC0, &__block_literal_global_114);
  }
  v3 = (void *)MEMORY[0x1E4F28C10];
  id v4 = [(PKPaymentCredentialMetadataDate *)self displayFormat];
  v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  uint64_t v6 = [v3 dateFormatFromTemplate:v4 options:0 locale:v5];

  [(id)_MergedGlobals_235 setDateFormat:v6];
  v7 = [(PKPaymentCredentialMetadata *)self value];
  v8 = _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v7, 0, 0);

  v9 = [(id)_MergedGlobals_235 stringFromDate:v8];

  return v9;
}

void __48__PKPaymentCredentialMetadataDate_displayString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_235;
  _MergedGlobals_235 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_235;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentCredentialMetadataDate *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentCredentialMetadataDate *)self _isEqualToMetadata:v4];
  }

  return v5;
}

- (BOOL)_isEqualToMetadata:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentCredentialMetadataDate;
  if ([(PKPaymentCredentialMetadata *)&v12 _isEqualToMetadata:v4])
  {
    BOOL v5 = (void *)v4[3];
    uint64_t v6 = self->_displayFormat;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        char v10 = 0;
      }
      else {
        char v10 = [(NSString *)v6 isEqualToString:v7];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_displayFormat];
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCredentialMetadataDate;
  id v4 = [(PKPaymentCredentialMetadata *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (NSString)displayFormat
{
  return self->_displayFormat;
}

- (void).cxx_destruct
{
}

@end