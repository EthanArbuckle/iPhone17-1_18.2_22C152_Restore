@interface _DPMLRecipeIDValidator
+ (id)checkClientIdentifier:(id)a3 againstNamespaceIdentifier:(id)a4 error:(id *)a5;
+ (id)sharedInstanceWithError:(id *)a3;
- (NSDictionary)association;
- (_DPMLRecipeIDValidator)initWithAssociation:(id)a3;
@end

@implementation _DPMLRecipeIDValidator

- (_DPMLRecipeIDValidator)initWithAssociation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPMLRecipeIDValidator;
  v6 = [(_DPMLRecipeIDValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_association, a3);
  }

  return v7;
}

+ (id)sharedInstanceWithError:(id *)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008344;
  block[3] = &unk_1000305F8;
  block[4] = a1;
  if (qword_10003DCE0 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10003DCE0, block);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) qword_10003DCD8;
LABEL_4:
  v4 = (void *)qword_10003DCD0;
  return v4;
}

+ (id)checkClientIdentifier:(id)a3 againstNamespaceIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
LABEL_10:
      +[_DPMLRuntimeError errorWithCode:300 description:v14];
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_11:
    v15 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_super v9 = +[_DPMLRecipeIDValidator sharedInstanceWithError:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 association];
    v12 = [v11 objectForKey:v8];

    if ([v12 containsObject:v7])
    {
      uint64_t v13 = 1;
    }
    else
    {
      v16 = [v7 stringByReplacingOccurrencesOfString:@"fedstats:" withString:&stru_100031EA0];
      uint64_t v13 = (uint64_t)[v12 containsObject:v16];
    }
    v15 = +[NSNumber numberWithBool:v13];
  }
  else
  {
    v15 = 0;
  }

LABEL_16:
  return v15;
}

- (NSDictionary)association
{
  return self->_association;
}

- (void).cxx_destruct
{
}

@end