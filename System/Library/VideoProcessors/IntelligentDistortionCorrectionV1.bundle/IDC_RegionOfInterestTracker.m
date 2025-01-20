@interface IDC_RegionOfInterestTracker
- ($A3B2E143E1A03423F9FC703C010436DC)getCropData;
- ($A3B2E143E1A03423F9FC703C010436DC)getRoiData;
- ($E7C12F026BB72AD05E76521440161B07)idcCrop;
- ($E7C12F026BB72AD05E76521440161B07)idcRoi;
- (BOOL)isCpuMaster;
- (MTLBuffer)metalBuffer;
- (id)init:(id)a3 metalBufferOffset:(unint64_t)a4 initialIdcRoi:(id *)a5;
- (unint64_t)metalBufferOffset;
- (void)setIdcCrop:(id *)a3;
- (void)setIdcRoi:(id *)a3;
- (void)setIsCpuMaster:(BOOL)a3;
- (void)setMetalBuffer:(id)a3;
- (void)setMetalBufferOffset:(unint64_t)a3;
- (void)setRoiData:(id)a3;
- (void)synchronizeData;
@end

@implementation IDC_RegionOfInterestTracker

- (id)init:(id)a3 metalBufferOffset:(unint64_t)a4 initialIdcRoi:(id *)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDC_RegionOfInterestTracker;
  v10 = [(IDC_RegionOfInterestTracker *)&v14 init];
  v11 = v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a5->var0;
    *(void *)&v10->_idcRoi.width = *(void *)&a5->var4;
    *(_OWORD *)&v10->_idcRoi.x0 = v12;
    objc_storeStrong((id *)&v10->_metalBuffer, a3);
    v11->_metalBufferOffset = a4;
    v11->_isCpuMaster = 1;
  }

  return v11;
}

- (void)synchronizeData
{
  if (!self->_isCpuMaster)
  {
    uint64_t v3 = [(MTLBuffer *)self->_metalBuffer contents];
    if (v3)
    {
      unint64_t v4 = v3 + self->_metalBufferOffset;
      int v5 = *(_DWORD *)v4;
      int v6 = *(_DWORD *)(v4 + 4);
      self->_idcRoi.x0 = *(_DWORD *)v4;
      self->_idcRoi.y0 = v6;
      int v7 = *(_DWORD *)(v4 + 8);
      int v8 = *(_DWORD *)(v4 + 12);
      self->_idcRoi.x1 = v7;
      self->_idcRoi.y1 = v8;
      *(_OWORD *)&self->_idcCrop.x0 = *(_OWORD *)(v4 + 16);
      self->_idcRoi.width = v7 - v5 + 1;
      self->_idcRoi.height = v8 - v6 + 1;
      self->_isCpuMaster = 1;
    }
  }
}

- (void)setRoiData:(id)a3
{
  self->_idcRoi.x0 = a3.var0;
  self->_idcRoi.y0 = a3.var1;
  self->_idcRoi.x1 = a3.var2;
  self->_idcRoi.y1 = a3.var3;
  self->_idcRoi.width = a3.var2 - a3.var0 + 1;
  self->_idcRoi.height = a3.var3 - a3.var1 + 1;
  self->_isCpuMaster = 1;
}

- ($A3B2E143E1A03423F9FC703C010436DC)getRoiData
{
  uint64_t v2 = *(void *)&self->_idcRoi.x1;
  uint64_t v3 = *(void *)&self->_idcRoi.x0;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- ($A3B2E143E1A03423F9FC703C010436DC)getCropData
{
  uint64_t v2 = *(void *)&self->_idcCrop.x1;
  uint64_t v3 = *(void *)&self->_idcCrop.x0;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- ($E7C12F026BB72AD05E76521440161B07)idcRoi
{
  *($C9BDC5777480221D04A3E8FE41CA822D *)retstr = *($C9BDC5777480221D04A3E8FE41CA822D *)((char *)self + 32);
  return self;
}

- (void)setIdcRoi:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_idcRoi.width = *(void *)&a3->var4;
  *(_OWORD *)&self->_idcRoi.x0 = v3;
}

- ($E7C12F026BB72AD05E76521440161B07)idcCrop
{
  *($C9BDC5777480221D04A3E8FE41CA822D *)retstr = *($C9BDC5777480221D04A3E8FE41CA822D *)((char *)self + 56);
  return self;
}

- (void)setIdcCrop:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_idcCrop.width = *(void *)&a3->var4;
  *(_OWORD *)&self->_idcCrop.x0 = v3;
}

- (MTLBuffer)metalBuffer
{
  return self->_metalBuffer;
}

- (void)setMetalBuffer:(id)a3
{
}

- (unint64_t)metalBufferOffset
{
  return self->_metalBufferOffset;
}

- (void)setMetalBufferOffset:(unint64_t)a3
{
  self->_metalBufferOffset = a3;
}

- (BOOL)isCpuMaster
{
  return self->_isCpuMaster;
}

- (void)setIsCpuMaster:(BOOL)a3
{
  self->_isCpuMaster = a3;
}

- (void).cxx_destruct
{
}

@end