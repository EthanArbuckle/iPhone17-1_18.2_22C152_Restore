@interface CoalitionMemoryUsage
- (int)process_jetsam_priority;
- (int64_t)ledger_swapins;
- (unint64_t)compressed_lifetime;
- (unint64_t)compressed_size;
- (unint64_t)phys_footprint_size;
- (unint64_t)process_count;
- (unint64_t)process_peak_phys_footprint;
- (unint64_t)process_phys_footprint_size;
- (unint64_t)purgeable_size;
- (unint64_t)wired_size;
- (void)setCompressed_lifetime:(unint64_t)a3;
- (void)setCompressed_size:(unint64_t)a3;
- (void)setLedger_swapins:(int64_t)a3;
- (void)setPhys_footprint_size:(unint64_t)a3;
- (void)setProcess_count:(unint64_t)a3;
- (void)setProcess_jetsam_priority:(int)a3;
- (void)setProcess_peak_phys_footprint:(unint64_t)a3;
- (void)setProcess_phys_footprint_size:(unint64_t)a3;
- (void)setPurgeable_size:(unint64_t)a3;
- (void)setWired_size:(unint64_t)a3;
@end

@implementation CoalitionMemoryUsage

- (unint64_t)wired_size
{
  return self->_wired_size;
}

- (void)setWired_size:(unint64_t)a3
{
  self->_wired_size = a3;
}

- (unint64_t)purgeable_size
{
  return self->_purgeable_size;
}

- (void)setPurgeable_size:(unint64_t)a3
{
  self->_purgeable_size = a3;
}

- (unint64_t)phys_footprint_size
{
  return self->_phys_footprint_size;
}

- (void)setPhys_footprint_size:(unint64_t)a3
{
  self->_phys_footprint_size = a3;
}

- (unint64_t)compressed_size
{
  return self->_compressed_size;
}

- (void)setCompressed_size:(unint64_t)a3
{
  self->_compressed_size = a3;
}

- (unint64_t)process_count
{
  return self->_process_count;
}

- (void)setProcess_count:(unint64_t)a3
{
  self->_process_count = a3;
}

- (unint64_t)process_phys_footprint_size
{
  return self->_process_phys_footprint_size;
}

- (void)setProcess_phys_footprint_size:(unint64_t)a3
{
  self->_process_phys_footprint_size = a3;
}

- (unint64_t)process_peak_phys_footprint
{
  return self->_process_peak_phys_footprint;
}

- (void)setProcess_peak_phys_footprint:(unint64_t)a3
{
  self->_process_peak_phys_footprint = a3;
}

- (int)process_jetsam_priority
{
  return self->_process_jetsam_priority;
}

- (void)setProcess_jetsam_priority:(int)a3
{
  self->_process_jetsam_priority = a3;
}

- (unint64_t)compressed_lifetime
{
  return self->_compressed_lifetime;
}

- (void)setCompressed_lifetime:(unint64_t)a3
{
  self->_compressed_lifetime = a3;
}

- (int64_t)ledger_swapins
{
  return self->_ledger_swapins;
}

- (void)setLedger_swapins:(int64_t)a3
{
  self->_ledger_swapins = a3;
}

@end