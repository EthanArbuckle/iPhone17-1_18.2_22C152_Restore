@interface PKODIServiceProviderAssessment
- (NSString)serviceIdentifier;
- (PKODIServiceProviderAssessment)initWithServiceProviderIdentifier:(id)a3 locationBundle:(id)a4;
- (id)description;
- (void)createODISession;
- (void)getAssessmentWithCompletion:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation PKODIServiceProviderAssessment

- (PKODIServiceProviderAssessment)initWithServiceProviderIdentifier:(id)a3 locationBundle:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKODIServiceProviderAssessment;
  v9 = [(PKODIAssessment *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_locationBundle, a4);
  }
  v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Creating PKODIServiceProviderAssessment with locationBundle %@, %@", buf, 0x16u);
  }

  return v10;
}

- (void)createODISession
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F5C988]) initWithServiceIdentifier:self->_serviceIdentifier forDSIDType:1 andLocationBundle:self->_locationBundle];
  [(PKODIAssessment *)self setOdiSession:v3];

  v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Created ODISession %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)getAssessmentWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    int v5 = [(PKODIAssessment *)self odiSession];

    if (v5)
    {
      v6 = [(PKODIAssessment *)self odiSession];
      [v6 getAssessment:v7];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    id v4 = v7;
  }
}

- (void)setServiceIdentifier:(id)a3
{
  int v5 = (NSString *)a3;
  if (self->_serviceIdentifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_serviceIdentifier, a3);
    [(PKODIServiceProviderAssessment *)self createODISession];
    int v5 = v6;
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"serviceIdentifier: '%@'; ", self->_serviceIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationBundle, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end