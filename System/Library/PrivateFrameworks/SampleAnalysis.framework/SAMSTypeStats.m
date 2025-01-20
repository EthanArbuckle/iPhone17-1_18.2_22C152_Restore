@interface SAMSTypeStats
- (unint64_t)bytes;
- (unint64_t)bytes_duplicate;
- (unint64_t)bytes_missing_load_info;
- (unint64_t)bytes_out_of_order;
- (unint64_t)count;
- (unint64_t)num_duplicate;
- (unint64_t)num_frames;
- (unint64_t)num_load_infos;
- (unint64_t)num_missing_load_info;
- (unint64_t)num_out_of_order;
- (void)addTask:(uint64_t)a3 thread:(uint64_t)a4 size:(uint64_t)a5 errors:;
- (void)setBytes:(unint64_t)a3;
- (void)setBytes_duplicate:(unint64_t)a3;
- (void)setBytes_missing_load_info:(unint64_t)a3;
- (void)setBytes_out_of_order:(unint64_t)a3;
- (void)setCount:(unint64_t)a3;
- (void)setNum_duplicate:(unint64_t)a3;
- (void)setNum_frames:(unint64_t)a3;
- (void)setNum_load_infos:(unint64_t)a3;
- (void)setNum_missing_load_info:(unint64_t)a3;
- (void)setNum_out_of_order:(unint64_t)a3;
@end

@implementation SAMSTypeStats

- (void)addTask:(uint64_t)a3 thread:(uint64_t)a4 size:(uint64_t)a5 errors:
{
  if (result)
  {
    if (a5)
    {
      if ((a5 & 2) != 0)
      {
        ++result[5];
        uint64_t v5 = 6;
      }
      else if ((a5 & 8) != 0)
      {
        ++result[9];
        uint64_t v5 = 10;
      }
      else
      {
        if ((a5 & 4) == 0) {
          return result;
        }
        ++result[7];
        uint64_t v5 = 8;
      }
    }
    else
    {
      uint64_t v6 = result[2] + a4;
      ++result[1];
      result[2] = v6;
      result[3] += *(unsigned int *)(a2 + 56);
      a4 = (*(_DWORD *)(a3 + 8) + *(_DWORD *)(a3 + 4));
      uint64_t v5 = 4;
    }
    result[v5] += a4;
  }
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_bytes = a3;
}

- (unint64_t)num_load_infos
{
  return self->_num_load_infos;
}

- (void)setNum_load_infos:(unint64_t)a3
{
  self->_num_load_infos = a3;
}

- (unint64_t)num_frames
{
  return self->_num_frames;
}

- (void)setNum_frames:(unint64_t)a3
{
  self->_num_frames = a3;
}

- (unint64_t)num_duplicate
{
  return self->_num_duplicate;
}

- (void)setNum_duplicate:(unint64_t)a3
{
  self->_num_duplicate = a3;
}

- (unint64_t)bytes_duplicate
{
  return self->_bytes_duplicate;
}

- (void)setBytes_duplicate:(unint64_t)a3
{
  self->_bytes_duplicate = a3;
}

- (unint64_t)num_out_of_order
{
  return self->_num_out_of_order;
}

- (void)setNum_out_of_order:(unint64_t)a3
{
  self->_num_out_of_order = a3;
}

- (unint64_t)bytes_out_of_order
{
  return self->_bytes_out_of_order;
}

- (void)setBytes_out_of_order:(unint64_t)a3
{
  self->_bytes_out_of_order = a3;
}

- (unint64_t)num_missing_load_info
{
  return self->_num_missing_load_info;
}

- (void)setNum_missing_load_info:(unint64_t)a3
{
  self->_num_missing_load_info = a3;
}

- (unint64_t)bytes_missing_load_info
{
  return self->_bytes_missing_load_info;
}

- (void)setBytes_missing_load_info:(unint64_t)a3
{
  self->_bytes_missing_load_info = a3;
}

@end