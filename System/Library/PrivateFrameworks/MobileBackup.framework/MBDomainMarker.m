@interface MBDomainMarker
- (BOOL)isDomainMarkedAsModified:(id)a3;
- (MBDomainMarker)init;
- (NSSet)modifiedDomainNames;
- (NSSet)unmodifiedDomainNames;
- (void)markModifiedDomain:(id)a3;
- (void)markUnmodifiedDomain:(id)a3;
- (void)setModifiedDomainNames:(id)a3;
- (void)setUnmodifiedDomainNames:(id)a3;
@end

@implementation MBDomainMarker

- (MBDomainMarker)init
{
  v9.receiver = self;
  v9.super_class = (Class)MBDomainMarker;
  v2 = [(MBDomainMarker *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    unmodifiedDomainNames = v3->_unmodifiedDomainNames;
    v3->_unmodifiedDomainNames = (NSMutableSet *)v4;

    uint64_t v6 = objc_opt_new();
    modifiedDomainNames = v3->_modifiedDomainNames;
    v3->_modifiedDomainNames = (NSMutableSet *)v6;
  }
  return v3;
}

- (NSSet)modifiedDomainNames
{
  id v2 = [(NSMutableSet *)self->_modifiedDomainNames copy];
  return (NSSet *)v2;
}

- (NSSet)unmodifiedDomainNames
{
  id v2 = [(NSMutableSet *)self->_unmodifiedDomainNames copy];
  return (NSSet *)v2;
}

- (void)markModifiedDomain:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_unmodifiedDomainNames removeObject:v5];
  [(NSMutableSet *)self->_modifiedDomainNames addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)markUnmodifiedDomain:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_modifiedDomainNames removeObject:v5];
  [(NSMutableSet *)self->_unmodifiedDomainNames addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isDomainMarkedAsModified:(id)a3
{
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = [(NSMutableSet *)v3->_modifiedDomainNames containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (void)setModifiedDomainNames:(id)a3
{
}

- (void)setUnmodifiedDomainNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDomainNames, 0);
  objc_storeStrong((id *)&self->_unmodifiedDomainNames, 0);
}

@end