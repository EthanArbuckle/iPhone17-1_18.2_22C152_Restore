@interface MBToolsDomainManager
- (MBToolsDomainManager)initWithTools:(id)a3 error:(id *)a4;
@end

@implementation MBToolsDomainManager

- (MBToolsDomainManager)initWithTools:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = +[MBPersona personalPersonaWithError:a4];
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)MBToolsDomainManager;
    v9 = [(MBToolsDomainManager *)&v12 initWithPersona:v8];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_tools, a3);
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end