@interface UIClassSwapper
+ (id)swapperForObject:(id)a3 withClassName:(id)a4;
- (UIClassSwapper)initWithCoder:(id)a3;
- (UIClassSwapper)initWithObject:(id)a3 andClassName:(id)a4;
- (id)className;
- (id)object;
- (id)performSelectorForObject:(id)a3 selector:(SEL)a4 withObject:(id)a5 withObject:(id)a6 withObject:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIClassSwapper

- (UIClassSwapper)initWithCoder:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"UIClassName"];
  Class v6 = NSClassFromString(v5);
  v7 = [v4 decodeObjectForKey:@"UIOriginalClassName"];
  Class v8 = NSClassFromString(v7);

  if (!v6)
  {
    v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Storyboard", &_MergedGlobals_1105) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v5;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unknown class %@ in Interface Builder file.\n", buf, 0xCu);
    }
  }
  v10 = [v4 _storyboardDecodingContext];
  v11 = [v10 sourceSegueTemplate];

  v12 = (const char *)[v11 prepareForChildViewControllerSelector];
  v13 = [v4 _storyboardDecodingContext];
  v14 = [v13 parentViewController];

  if (v14)
  {
    v15 = [v4 _storyboardDecodingContext];
    v16 = [v15 parentViewController];
    v17 = [v4 _storyboardDecodingContext];
    v12 = (const char *)objc_msgSend(v16, "_customSelectorToCreateChildViewControllerAtIndex:", objc_msgSend(v17, "childViewControllerIndex"));
  }
  v18 = [v11 viewController];
  v19 = [v4 _storyboardDecodingContext];
  v20 = [v19 creator];

  if (v20)
  {
    v21 = [v4 _storyboardDecodingContext];
    v22 = [v21 creator];

    v23 = [v4 _storyboardDecodingContext];
    [v23 setCreator:0];

    v24 = [v4 _storyboardDecodingContext];
    [v24 setClassSwapperTemplate:self];

    v25 = ((void (**)(void, id))v22)[2](v22, v4);
    v26 = [v4 _storyboardDecodingContext];
    v27 = v26;
    if (v25)
    {
      v57 = v8;
      v58 = v5;
      v28 = [v26 classSwapperTemplate];

      if (v28)
      {
        v29 = [MEMORY[0x1E4F28B00] currentHandler];
        [v29 handleFailureInMethod:a2 object:self file:@"UIClassSwapper.m" lineNumber:134 description:@"Custom instantiated view controller must call -[super initWithCoder:]"];
      }
      v30 = [v4 _storyboardDecodingContext];
      [v30 setClassSwapperTemplate:0];

LABEL_16:
      if (v6) {
        v40 = v6;
      }
      else {
        v40 = v57;
      }
      v5 = v58;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v41 = [MEMORY[0x1E4F28B00] currentHandler];
        v42 = NSStringFromClass(v40);
        [v41 handleFailureInMethod:a2, self, @"UIClassSwapper.m", 150, @"Custom instantiated %@ must be kind of class %@", v25, v42 object file lineNumber description];

        v5 = v58;
      }
      goto LABEL_34;
    }
    [v26 setClassSwapperTemplate:0];
  }
  else if (objc_opt_respondsToSelector())
  {
    v57 = v8;
    v58 = v5;
    v31 = [v4 _storyboardDecodingContext];
    [v31 setClassSwapperTemplate:self];

    v32 = [v4 _storyboardDecodingContext];
    v33 = [v32 sender];
    v34 = [v11 identifier];
    v25 = [(UIClassSwapper *)self performSelectorForObject:v18 selector:v12 withObject:v4 withObject:v33 withObject:v34];

    v35 = [v4 _storyboardDecodingContext];
    v36 = v35;
    if (v25)
    {
      v37 = [v35 classSwapperTemplate];

      if (v37)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        v39 = NSStringFromSelector(v12);
        [v38 handleFailureInMethod:a2, self, @"UIClassSwapper.m", 139, @"Custom instantiated view controller must call -[super initWithCoder:] when created from -[%@ %@]", v18, v39 object file lineNumber description];
      }
      v22 = [v4 _storyboardDecodingContext];
      [v22 setClassSwapperTemplate:0];
      goto LABEL_16;
    }
    [v35 setClassSwapperTemplate:0];

    v49 = *(NSObject **)(__UILogGetCategoryCachedImpl("Storyboard", &qword_1EB2614F0) + 8);
    Class v8 = v57;
    v5 = v58;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = v49;
      v51 = NSStringFromSelector(v12);
      *(_DWORD *)buf = 138412802;
      v61 = v18;
      __int16 v62 = 2112;
      v63 = v51;
      __int16 v64 = 2112;
      v65 = v58;
      _os_log_impl(&dword_1853B0000, v50, OS_LOG_TYPE_ERROR, "-[%@ %@] returned nil, falling back to -[%@ initWithCoder:]", buf, 0x20u);

      Class v8 = v57;
      v5 = v58;
    }
  }
  else if (v12)
  {
    v43 = *(NSObject **)(__UILogGetCategoryCachedImpl("Storyboard", &qword_1EB2614F8) + 8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = v43;
      v45 = v5;
      v46 = v44;
      NSStringFromSelector(v12);
      v48 = v47 = v8;
      *(_DWORD *)buf = 138412546;
      v61 = v18;
      __int16 v62 = 2112;
      v63 = v48;
      _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "Unable to find method -[%@ %@]", buf, 0x16u);

      Class v8 = v47;
      v5 = v45;
    }
  }
  if (v6) {
    v52 = v6;
  }
  else {
    v52 = v8;
  }
  id v53 = [v52 alloc];
  [v4 replaceObject:self withObject:v53];
  if (v8 == (Class)objc_opt_class()) {
    uint64_t v54 = [v53 init];
  }
  else {
    uint64_t v54 = [v53 initWithCoder:v4];
  }
  v25 = (void *)v54;
LABEL_34:
  v55 = v25;

  return v55;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->object, 0);
  objc_storeStrong((id *)&self->className, 0);
}

- (UIClassSwapper)initWithObject:(id)a3 andClassName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIClassSwapper;
  v9 = [(UIClassSwapper *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->object, a3);
    uint64_t v11 = [v8 copy];
    className = v10->className;
    v10->className = (NSString *)v11;
  }
  return v10;
}

- (id)performSelectorForObject:(id)a3 selector:(SEL)a4 withObject:(id)a5 withObject:(id)a6 withObject:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!a4) {
    [(UIClassSwapper *)self doesNotRecognizeSelector:0];
  }
  v16 = objc_msgSend(v12, a4, v13, v14, v15);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id object = self->object;
  id v5 = a3;
  [object encodeWithCoder:v5];
  [v5 encodeObject:self->className forKey:@"UIClassName"];
  Class v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"UIOriginalClassName"];
}

+ (id)swapperForObject:(id)a3 withClassName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithObject:v7 andClassName:v6];

  return v8;
}

- (id)className
{
  return self->className;
}

- (id)object
{
  return self->object;
}

@end