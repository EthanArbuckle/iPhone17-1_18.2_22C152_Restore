@interface SUICKPMediaPunchoutCardSectionViewController
- (BOOL)shouldHandleEngagement:(id)a3 forCardSection:(id)a4;
@end

@implementation SUICKPMediaPunchoutCardSectionViewController

- (BOOL)shouldHandleEngagement:(id)a3 forCardSection:(id)a4
{
  v5 = [a3 backingFeedback];
  v6 = [v5 destination];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F316A0]);
    [v7 setPunchout:v6];
    v8 = [(CRKCardSectionViewController *)self delegate];
    if (((objc_opt_respondsToSelector() & 1) == 0
       || [v8 canPerformCommand:v7 forCardSectionViewController:self])
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      int v9 = [v8 performCommand:v7 forCardSectionViewController:self] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

@end