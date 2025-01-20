@interface H13FastRawScalePDCArgs
- (MTLBuffer)staticDefectPerLineIndexBase;
- (MTLBuffer)staticDefectProcessIndexList;
- (MTLBuffer)staticDefectTable;
- (MTLTexture)detectionDynDesp0LutTex;
- (MTLTexture)detectionDynDesp12LutTex;
- (MTLTexture)detectionHighlightLutTex;
- (MTLTexture)flatThdLutTex;
- (MTLTexture)hoclStaticXtalkLutTex;
- (MTLTexture)hoclXtalkLutTex;
- (MTLTexture)pdpGainTex;
- (MTLTexture)xtalkLutTex;
- (void)setDetectionDynDesp0LutTex:(id)a3;
- (void)setDetectionDynDesp12LutTex:(id)a3;
- (void)setDetectionHighlightLutTex:(id)a3;
- (void)setFlatThdLutTex:(id)a3;
- (void)setHoclStaticXtalkLutTex:(id)a3;
- (void)setHoclXtalkLutTex:(id)a3;
- (void)setPdpGainTex:(id)a3;
- (void)setStaticDefectPerLineIndexBase:(id)a3;
- (void)setStaticDefectProcessIndexList:(id)a3;
- (void)setStaticDefectTable:(id)a3;
- (void)setXtalkLutTex:(id)a3;
@end

@implementation H13FastRawScalePDCArgs

- (MTLTexture)xtalkLutTex
{
  return self->_pdpGainTex;
}

- (void)setXtalkLutTex:(id)a3
{
}

- (MTLTexture)pdpGainTex
{
  return self->_hoclXtalkLutTex;
}

- (void)setPdpGainTex:(id)a3
{
}

- (MTLTexture)hoclXtalkLutTex
{
  return self->_hoclStaticXtalkLutTex;
}

- (void)setHoclXtalkLutTex:(id)a3
{
}

- (MTLTexture)hoclStaticXtalkLutTex
{
  return self->_flatThdLutTex;
}

- (void)setHoclStaticXtalkLutTex:(id)a3
{
}

- (MTLTexture)flatThdLutTex
{
  return self->_detectionDynDesp0LutTex;
}

- (void)setFlatThdLutTex:(id)a3
{
}

- (MTLTexture)detectionDynDesp0LutTex
{
  return self->_detectionDynDesp12LutTex;
}

- (void)setDetectionDynDesp0LutTex:(id)a3
{
}

- (MTLTexture)detectionDynDesp12LutTex
{
  return self->_detectionHighlightLutTex;
}

- (void)setDetectionDynDesp12LutTex:(id)a3
{
}

- (MTLTexture)detectionHighlightLutTex
{
  return self->_staticDefectTable;
}

- (void)setDetectionHighlightLutTex:(id)a3
{
}

- (MTLBuffer)staticDefectTable
{
  return self->_staticDefectProcessIndexList;
}

- (void)setStaticDefectTable:(id)a3
{
}

- (MTLBuffer)staticDefectProcessIndexList
{
  return self->_staticDefectPerLineIndexBase;
}

- (void)setStaticDefectProcessIndexList:(id)a3
{
}

- (MTLBuffer)staticDefectPerLineIndexBase
{
  return self[1].super.isa;
}

- (void)setStaticDefectPerLineIndexBase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_staticDefectPerLineIndexBase, 0);
  objc_storeStrong((id *)&self->_staticDefectProcessIndexList, 0);
  objc_storeStrong((id *)&self->_staticDefectTable, 0);
  objc_storeStrong((id *)&self->_detectionHighlightLutTex, 0);
  objc_storeStrong((id *)&self->_detectionDynDesp12LutTex, 0);
  objc_storeStrong((id *)&self->_detectionDynDesp0LutTex, 0);
  objc_storeStrong((id *)&self->_flatThdLutTex, 0);
  objc_storeStrong((id *)&self->_hoclStaticXtalkLutTex, 0);
  objc_storeStrong((id *)&self->_hoclXtalkLutTex, 0);

  objc_storeStrong((id *)&self->_pdpGainTex, 0);
}

@end