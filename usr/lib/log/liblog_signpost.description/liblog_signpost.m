uint64_t OSLogCopyFormattedString(uint64_t a1, void *a2)
{
  SignpostFormattedString(a1, a2, @"signpost.description");
  return objc_claimAutoreleasedReturnValue();
}

id SignpostFormattedString(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 && v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v5 stringValue];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_10:
        v8 = 0;
        goto LABEL_11;
      }
      uint64_t v9 = [v5 stringByReplacingOccurrencesOfString:&stru_26DB13320 withString:&stru_26DB13340];
    }
    v10 = (void *)v9;
    if (v9)
    {
      v11 = [NSString stringWithFormat:@"%@%@%@%s%@%@%@", @"__##__", v7, @"#____#", a1, @"#_##_#", v9, @"##__##"];
      v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11];

      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}