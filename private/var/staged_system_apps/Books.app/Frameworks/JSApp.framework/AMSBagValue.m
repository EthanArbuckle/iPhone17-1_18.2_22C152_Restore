@interface AMSBagValue
- (id)_errorForAirplaneMode;
- (id)jsa_valueWithError:(id *)a3;
- (void)jsa_valueWithCompletion:(id)a3;
@end

@implementation AMSBagValue

- (void)jsa_valueWithCompletion:(id)a3
{
  id v9 = a3;
  if ([(AMSBagValue *)self isLoaded]
    || (+[JSANetwork sharedInstance],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isReachable],
        v4,
        (v5 & 1) != 0))
  {
    [(AMSBagValue *)self valueWithCompletion:v9];
  }
  else
  {
    v6 = [(AMSBagValue *)self _errorForAirplaneMode];
    id v7 = objc_retainBlock(v9);
    v8 = v7;
    if (v7) {
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v6);
    }
  }
}

- (id)jsa_valueWithError:(id *)a3
{
  if ([(AMSBagValue *)self isLoaded]
    || (+[JSANetwork sharedInstance],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isReachable],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = [(AMSBagValue *)self valueWithError:a3];
  }
  else if (a3)
  {
    id v9 = [(AMSBagValue *)self _errorForAirplaneMode];
    id v7 = 0;
    *a3 = v9;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_errorForAirplaneMode
{
  if (objc_opt_respondsToSelector()) {
    CFStringRef v3 = (const __CFString *)[(AMSBagValue *)self performSelector:"key"];
  }
  else {
    CFStringRef v3 = @"(unknown key)";
  }
  v4 = +[NSString stringWithFormat:@"Failed to load bag value for %@ given there's no cache and device is offline", v3];
  unsigned __int8 v5 = +[NSError bu_errorWithDomain:@"JSAErrorDomain" code:110 alertTitle:@"Attempted to load bag with no network" alertMessage:v4];

  return v5;
}

@end