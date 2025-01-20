@interface SignpostSerializationFilterConfiguration
- (SignpostSupportExactProcessNameFilter)processNameFilter;
- (SignpostSupportPIDFilter)pidFilter;
- (SignpostSupportSubsystemCategoryFilter)subsystemCategoryFilter;
- (SignpostSupportUniquePIDFilter)uniquePidFilter;
- (void)setPidFilter:(id)a3;
- (void)setProcessNameFilter:(id)a3;
- (void)setSubsystemCategoryFilter:(id)a3;
- (void)setUniquePidFilter:(id)a3;
@end

@implementation SignpostSerializationFilterConfiguration

- (SignpostSupportSubsystemCategoryFilter)subsystemCategoryFilter
{
  return self->_subsystemCategoryFilter;
}

- (void)setSubsystemCategoryFilter:(id)a3
{
}

- (SignpostSupportPIDFilter)pidFilter
{
  return self->_pidFilter;
}

- (void)setPidFilter:(id)a3
{
}

- (SignpostSupportUniquePIDFilter)uniquePidFilter
{
  return self->_uniquePidFilter;
}

- (void)setUniquePidFilter:(id)a3
{
}

- (SignpostSupportExactProcessNameFilter)processNameFilter
{
  return self->_processNameFilter;
}

- (void)setProcessNameFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processNameFilter, 0);
  objc_storeStrong((id *)&self->_uniquePidFilter, 0);
  objc_storeStrong((id *)&self->_pidFilter, 0);
  objc_storeStrong((id *)&self->_subsystemCategoryFilter, 0);
}

@end