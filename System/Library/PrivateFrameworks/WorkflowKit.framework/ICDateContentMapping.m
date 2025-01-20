@interface ICDateContentMapping
- (ICDateContentMapping)initWithDefinition:(id)a3;
- (NSDateFormatter)dateFormatter;
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)setDateFormatter:(id)a3;
@end

@implementation ICDateContentMapping

- (void).cxx_destruct
{
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6551C70;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(ICContentMapping *)self getContentCollection:v10 withInput:a4 parameters:a5];
}

void __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v5[3] = &unk_1E6551810;
    id v4 = *(id *)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v3 getObjectRepresentation:v5 forClass:objc_opt_class()];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a4;
  id v8 = a2;
  id v10 = [v6 dateFormatter];
  id v9 = [v10 stringFromDate:v8];

  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v9, v7);
}

- (ICDateContentMapping)initWithDefinition:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDateContentMapping;
  uint64_t v5 = [(ICContentMapping *)&v11 initWithDefinition:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = (NSDateFormatter *)v6;

    id v8 = [v4 objectForKey:@"DateFormat"];
    [(NSDateFormatter *)v5->_dateFormatter setDateFormat:v8];

    id v9 = v5;
  }

  return v5;
}

@end