@interface SWCPattern
@end

@implementation SWCPattern

void __71___SWCPattern_Private___debug_descriptionOfStorage_forObject_redacted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  cf = a3;
  if (_NSIsNSDictionary())
  {
    uint64_t v4 = [(__CFString *)cf count];
    if (v4)
    {
      if (v4 == 1) {
        v5 = @"{ <private> }";
      }
      else {
        v5 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"{ <private> * %llu }", v4);
      }
    }
    else
    {
      v5 = @"{ }";
    }
  }
  else
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      v7 = cf;
      goto LABEL_11;
    }
    v5 = @"<private>";
  }

  v7 = v5;
LABEL_11:
  cfa = v7;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

@end