@interface ICSTodo(REMSaveRequestImporting)
- (__CFString)rem_nonNilSummary;
@end

@implementation ICSTodo(REMSaveRequestImporting)

- (__CFString)rem_nonNilSummary
{
  v2 = [a1 summary];
  if (v2)
  {
    v3 = [a1 summary];
  }
  else
  {
    v3 = &stru_1F1339A18;
  }

  return v3;
}

@end