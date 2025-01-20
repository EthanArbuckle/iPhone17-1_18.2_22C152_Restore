@interface PendingDomainUpdate
- (NSArray)domains;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setDomains:(id)a3;
@end

@implementation PendingDomainUpdate

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_domains, 0);
}

@end