@interface SUUIPassbookPassDataConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUIPassbookPassDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = SUUIPassKitCoreFramework();
  id v12 = 0;
  v8 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Pkpass.isa, v7)), "initWithData:error:", v6, &v12);

  id v9 = v12;
  v10 = v9;
  if (a5 && !v8) {
    *a5 = v9;
  }

  return v8;
}

@end