@interface PKPaymentHeroImageSet
- (PKPaymentHeroImageSet)initWithDictionary:(id)a3;
- (id)imageForPreferredLanguages:(id)a3 scale:(double)a4;
@end

@implementation PKPaymentHeroImageSet

- (PKPaymentHeroImageSet)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = [(PKPaymentHeroImageSet *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (id)imageForPreferredLanguages:(id)a3 scale:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(NSDictionary *)self->_model objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (v11)
        {
          v12 = v11;

          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v12 = [(NSDictionary *)self->_model objectForKey:@"base"];
  if (v12)
  {
LABEL_14:
    if (a4 <= 2.0) {
      v14 = @"2x";
    }
    else {
      v14 = @"3x";
    }
    v15 = v14;
    uint64_t v16 = [v12 objectForKey:v15];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = v15;
    }
    else
    {
      if (a4 >= 3.0) {
        v19 = @"2x";
      }
      else {
        v19 = @"3x";
      }
      v18 = v19;

      v20 = [v12 objectForKey:v18];
      if (!v20) {
        v20 = v12;
      }
      v17 = v20;
    }
    v13 = [[PKPaymentHeroImageModel alloc] initWithDictionary:v17];
  }
  else
  {
    v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find a matching language in hero image set", v22, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end