@interface NSError
@end

@implementation NSError

id __43__NSError_MSVErrorAdditions__msv_signature__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(id *)(a1 + 32) == v3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  v4 = objc_msgSend(v3, "msv_signature");

  return v4;
}

void __51__NSError_MSVErrorAdditions__msv_analyticSignature__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v7 = objc_msgSend(v8, "msv_analyticSignature");
    [v6 appendString:v7];
  }
  else
  {
    [*(id *)(a1 + 32) appendString:@"?"];
  }
  if ([*(id *)(a1 + 40) count] - 1 > a3) {
    [*(id *)(a1 + 32) appendString:@","];
  }
}

id __63__NSError_MSVErrorAdditions__msv_errorByRemovingUnsafeUserInfo__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (*MEMORY[0x1E4F28A50] == a2 || *MEMORY[0x1E4F28750] == a2)
  {
    id v7 = v4;
  }
  else
  {
    _MSVSanitizedPropertyListValue(v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

uint64_t __63__NSError_MSVErrorAdditions__msv_errorByRemovingUnsafeUserInfo__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "msv_errorByRemovingUnsafeUserInfo");
}

uint64_t __63__NSError_MSVErrorAdditions__msv_errorByRemovingUnsafeUserInfo__block_invoke()
{
  return _NSIsNSString();
}

@end