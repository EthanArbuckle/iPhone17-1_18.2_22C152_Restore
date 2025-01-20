@interface GTError_tools_diagnostics
- (id)dy_errorSignature;
- (id)localizedDescription;
@end

@implementation GTError_tools_diagnostics

- (id)dy_errorSignature
{
  id result = (id)_StringForError((uint64_t)[(GTError_tools_diagnostics *)self code]);
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)GTError_tools_diagnostics;
    return [(GTError_tools_diagnostics *)&v4 dy_errorSignature];
  }
  return result;
}

- (id)localizedDescription
{
  id v3 = [(GTError_tools_diagnostics *)self userInfo];
  if (!v3 || (id result = [v3 objectForKey:NSLocalizedDescriptionKey]) == 0)
  {
    id v5 = [(GTError_tools_diagnostics *)self code];
    if (!objc_msgSend(-[GTError_tools_diagnostics domain](self, "domain"), "isEqualToString:", @"DYErrorDomain")|| (id result = (id)_StringForError((uint64_t)v5)) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GTError_tools_diagnostics;
      return [(GTError_tools_diagnostics *)&v6 localizedDescription];
    }
  }
  return result;
}

@end