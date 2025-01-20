@interface RSRecessedAreaReconstructor
- (RSRecessedAreaReconstructor)init;
- (id).cxx_construct;
@end

@implementation RSRecessedAreaReconstructor

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = xmmword_25B5F1070;
  *(_OWORD *)((char *)self + 40) = xmmword_25B5F1080;
  *(_OWORD *)((char *)self + 56) = xmmword_25B5F1090;
  *((void *)self + 9) = 0x3F0000003E4CCCCDLL;
  *((void *)self + 10) = 0x3F40000000000003;
  *((_DWORD *)self + 22) = 3;
  *(_OWORD *)((char *)self + 92) = xmmword_25B5F10A0;
  *(_OWORD *)((char *)self + 108) = xmmword_25B5F10B0;
  *(_OWORD *)((char *)self + 124) = xmmword_25B5F10C0;
  *((_DWORD *)self + 35) = 2;
  *((void *)self + 5) = 0x41F0000041A00000;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  sub_25B3FB178((uint64_t)&self->_last_frame_recall_idx);
  objc_storeStrong((id *)&self->_recessed_area_pool, 0);

  objc_storeStrong((id *)&self->_current_frame_recessed_area_list, 0);
}

- (RSRecessedAreaReconstructor)init
{
  v12.receiver = self;
  v12.super_class = (Class)RSRecessedAreaReconstructor;
  v4 = [(RSRecessedAreaReconstructor *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], v2, v3);
    current_frame_recessed_area_list = v4->_current_frame_recessed_area_list;
    v4->_current_frame_recessed_area_list = (NSMutableArray *)v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8);
    recessed_area_pool = v4->_recessed_area_pool;
    v4->_recessed_area_pool = (NSMutableArray *)v9;
  }
  return v4;
}

@end