@interface PKPaymentHeroImageModel
- (NSString)imageSha;
- (NSURL)url;
- (PKPaymentHeroImageModel)initWithDictionary:(id)a3;
@end

@implementation PKPaymentHeroImageModel

- (PKPaymentHeroImageModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentHeroImageModel *)self init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 PKURLForKey:@"url"];
  url = v5->_url;
  v5->_url = (NSURL *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"sha1"];
  imageSha = v5->_imageSha;
  v5->_imageSha = (NSString *)v8;

  if (!v5->_url) {
    goto LABEL_5;
  }
  if (v5->_imageSha)
  {
LABEL_4:
    v10 = v5;
  }
  else
  {
LABEL_5:
    v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Invalid hero image model", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)imageSha
{
  return self->_imageSha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSha, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end