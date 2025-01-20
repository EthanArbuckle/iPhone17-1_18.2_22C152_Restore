@interface NRFFrameMetadata
- (BOOL)allowSpatialCCM;
- (BOOL)hasFinalCropRect;
- (BOOL)hasMinimumValidBufferRectForGDC;
- (BOOL)hasValidClippingData;
- (BOOL)hasZoomRects;
- (BOOL)idcProcessingCandidate;
- (BOOL)isEVMFrame;
- (BOOL)isHWISPFrame;
- (BOOL)isLongFrame;
- (BOOL)isPreBracketedFrame;
- (BOOL)isStationary;
- (BOOL)metadataHasHDRLtmCurves;
- (BOOL)metadataHasLtmCurves;
- (BOOL)metadataHasLtmCurvesForBackground;
- (BOOL)zoomApplied;
- (CGAffineTransform)zoomTransform;
- (CGRect)ROI;
- (CGRect)finalCropRect;
- (CGRect)minimumValidBufferRectForGDC;
- (CGRect)zoomDstRect;
- (CGRect)zoomSrcRect;
- (LocalHistogramClippingDataGeneric)clippingData;
- (NRFFrameMetadata)init;
- (NSArray)bodies;
- (NSArray)faces;
- (NSMutableDictionary)zoomRelatedMetadata;
- (NSString)portType;
- (__n128)awbGains;
- (__n128)awbSkinGains;
- (__n128)awbSkyGains;
- (__n128)colorCorrectionMatrix;
- (__n128)setColorCorrectionMatrix:(__n128)a3;
- (double)finalAspectRatio;
- (double)opticalCenter;
- (exposureParameters)exposureParams;
- (float)daylightScore;
- (float)fdAWBChistMixFactor;
- (float)finalCropRectZoomRatio;
- (float)sensorCropRatio;
- (float)skinWBWeightForMIWB;
- (int)exifOrientation;
- (int)sensorID;
- (int64_t)averageFocusScore;
- (ltmCurves)HDRltmCurves;
- (ltmCurves)ltmCurves;
- (ltmCurves)ltmCurvesForBackground;
- (void)dealloc;
- (void)setAllowSpatialCCM:(BOOL)a3;
- (void)setAverageFocusScore:(int64_t)a3;
- (void)setAwbGains:(NRFFrameMetadata *)self;
- (void)setAwbSkinGains:(NRFFrameMetadata *)self;
- (void)setAwbSkyGains:(NRFFrameMetadata *)self;
- (void)setBodies:(id)a3;
- (void)setDaylightScore:(float)a3;
- (void)setExifOrientation:(int)a3;
- (void)setFaces:(id)a3;
- (void)setFdAWBChistMixFactor:(float)a3;
- (void)setFinalAspectRatio:(double)a3;
- (void)setFinalCropRect:(CGRect)a3;
- (void)setFinalCropRectZoomRatio:(float)a3;
- (void)setHasFinalCropRect:(BOOL)a3;
- (void)setHasMinimumValidBufferRectForGDC:(BOOL)a3;
- (void)setHasValidClippingData:(BOOL)a3;
- (void)setHasZoomRects:(BOOL)a3;
- (void)setIdcProcessingCandidate:(BOOL)a3;
- (void)setIsEVMFrame:(BOOL)a3;
- (void)setIsHWISPFrame:(BOOL)a3;
- (void)setIsLongFrame:(BOOL)a3;
- (void)setIsPreBracketedFrame:(BOOL)a3;
- (void)setIsStationary:(BOOL)a3;
- (void)setMetadataHasHDRLtmCurves:(BOOL)a3;
- (void)setMetadataHasLtmCurves:(BOOL)a3;
- (void)setMetadataHasLtmCurvesForBackground:(BOOL)a3;
- (void)setMinimumValidBufferRectForGDC:(CGRect)a3;
- (void)setOpticalCenter:(NRFFrameMetadata *)self;
- (void)setPortType:(id)a3;
- (void)setSensorCropRatio:(float)a3;
- (void)setSensorID:(int)a3;
- (void)setSkinWBWeightForMIWB:(float)a3;
- (void)setZoomApplied:(BOOL)a3;
- (void)setZoomDstRect:(CGRect)a3;
- (void)setZoomRelatedMetadata:(id)a3;
- (void)setZoomSrcRect:(CGRect)a3;
- (void)setZoomTransform:(CGAffineTransform *)a3;
@end

@implementation NRFFrameMetadata

- (NRFFrameMetadata)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)NRFFrameMetadata;
  v2 = [(NRFFrameMetadata *)&v12 init];
  if (!v2) {
    goto LABEL_8;
  }
  v3 = (CGRect *)malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
  v2->_ROI = v3;
  if (!v3) {
    goto LABEL_10;
  }
  v4 = (ltmCurves *)malloc_type_calloc(1uLL, 0x36770uLL, 0x100004031D9F0A3uLL);
  v2->_ltmCurves = v4;
  if (!v4) {
    goto LABEL_10;
  }
  v5 = (ltmCurves *)malloc_type_calloc(1uLL, 0x36770uLL, 0x100004031D9F0A3uLL);
  v2->_HDRltmCurves = v5;
  if (!v5) {
    goto LABEL_10;
  }
  v6 = (ltmCurves *)malloc_type_calloc(1uLL, 0x36770uLL, 0x100004031D9F0A3uLL);
  v2->_ltmCurvesForBackground = v6;
  if (v6
    && (v7 = (exposureParameters *)malloc_type_calloc(1uLL, 0x80uLL, 0x100004047782EA2uLL),
        (v2->_exposureParams = v7) != 0)
    && (v8 = (LocalHistogramClippingDataGeneric *)malloc_type_calloc(1uLL, 0x10uLL, 0x102004075DEAD68uLL),
        (v2->_clippingData = v8) != 0))
  {
LABEL_8:
    v9 = v2;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  free(self->_ROI);
  free(self->_ltmCurves);
  free(self->_HDRltmCurves);
  free(self->_ltmCurvesForBackground);
  free(self->_exposureParams);
  free(self->_clippingData);
  v3.receiver = self;
  v3.super_class = (Class)NRFFrameMetadata;
  [(NRFFrameMetadata *)&v3 dealloc];
}

- (NSArray)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
}

- (NSArray)bodies
{
  return self->_bodies;
}

- (void)setBodies:(id)a3
{
}

- (BOOL)hasValidClippingData
{
  return self->_hasValidClippingData;
}

- (void)setHasValidClippingData:(BOOL)a3
{
  self->_hasValidClippingData = a3;
}

- (LocalHistogramClippingDataGeneric)clippingData
{
  return self->_clippingData;
}

- (exposureParameters)exposureParams
{
  return self->_exposureParams;
}

- (BOOL)metadataHasLtmCurves
{
  return self->_metadataHasLtmCurves;
}

- (void)setMetadataHasLtmCurves:(BOOL)a3
{
  self->_metadataHasLtmCurves = a3;
}

- (ltmCurves)ltmCurves
{
  return self->_ltmCurves;
}

- (BOOL)metadataHasLtmCurvesForBackground
{
  return self->_metadataHasLtmCurvesForBackground;
}

- (void)setMetadataHasLtmCurvesForBackground:(BOOL)a3
{
  self->_metadataHasLtmCurvesForBackground = a3;
}

- (ltmCurves)ltmCurvesForBackground
{
  return self->_ltmCurvesForBackground;
}

- (BOOL)metadataHasHDRLtmCurves
{
  return self->_metadataHasHDRLtmCurves;
}

- (void)setMetadataHasHDRLtmCurves:(BOOL)a3
{
  self->_metadataHasHDRLtmCurves = a3;
}

- (ltmCurves)HDRltmCurves
{
  return self->_HDRltmCurves;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (BOOL)isHWISPFrame
{
  return self->_isHWISPFrame;
}

- (void)setIsHWISPFrame:(BOOL)a3
{
  self->_isHWISPFrame = a3;
}

- (BOOL)isPreBracketedFrame
{
  return self->_isPreBracketedFrame;
}

- (void)setIsPreBracketedFrame:(BOOL)a3
{
  self->_isPreBracketedFrame = a3;
}

- (BOOL)isEVMFrame
{
  return self->_isEVMFrame;
}

- (void)setIsEVMFrame:(BOOL)a3
{
  self->_isEVMFrame = a3;
}

- (BOOL)isLongFrame
{
  return self->_isLongFrame;
}

- (void)setIsLongFrame:(BOOL)a3
{
  self->_isLongFrame = a3;
}

- (int64_t)averageFocusScore
{
  return self->_averageFocusScore;
}

- (void)setAverageFocusScore:(int64_t)a3
{
  self->_averageFocusScore = a3;
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (void)setIsStationary:(BOOL)a3
{
  self->_isStationary = a3;
}

- (BOOL)allowSpatialCCM
{
  return self->_allowSpatialCCM;
}

- (void)setAllowSpatialCCM:(BOOL)a3
{
  self->_allowSpatialCCM = a3;
}

- (CGRect)ROI
{
  return self->_ROI;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

- (__n128)colorCorrectionMatrix
{
  return a1[21];
}

- (__n128)setColorCorrectionMatrix:(__n128)a3
{
  result[21] = a2;
  result[22] = a3;
  result[23] = a4;
  return result;
}

- (float)sensorCropRatio
{
  return self->_sensorCropRatio;
}

- (void)setSensorCropRatio:(float)a3
{
  self->_sensorCropRatio = a3;
}

- (BOOL)hasZoomRects
{
  return self->_hasZoomRects;
}

- (void)setHasZoomRects:(BOOL)a3
{
  self->_hasZoomRects = a3;
}

- (CGRect)zoomSrcRect
{
  double x = self->_zoomSrcRect.origin.x;
  double y = self->_zoomSrcRect.origin.y;
  double width = self->_zoomSrcRect.size.width;
  double height = self->_zoomSrcRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomSrcRect:(CGRect)a3
{
  self->_zoomSrcRect = a3;
}

- (CGRect)zoomDstRect
{
  double x = self->_zoomDstRect.origin.x;
  double y = self->_zoomDstRect.origin.y;
  double width = self->_zoomDstRect.size.width;
  double height = self->_zoomDstRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomDstRect:(CGRect)a3
{
  self->_zoomDstRect = a3;
}

- (BOOL)hasFinalCropRect
{
  return self->_hasFinalCropRect;
}

- (void)setHasFinalCropRect:(BOOL)a3
{
  self->_hasFinalCropRect = a3;
}

- (CGRect)finalCropRect
{
  double x = self->_finalCropRect.origin.x;
  double y = self->_finalCropRect.origin.y;
  double width = self->_finalCropRect.size.width;
  double height = self->_finalCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFinalCropRect:(CGRect)a3
{
  self->_finalCropRect = a3;
}

- (float)finalCropRectZoomRatio
{
  return self->_finalCropRectZoomRatio;
}

- (void)setFinalCropRectZoomRatio:(float)a3
{
  self->_finalCropRectZoomRatio = a3;
}

- (BOOL)hasMinimumValidBufferRectForGDC
{
  return self->_hasMinimumValidBufferRectForGDC;
}

- (void)setHasMinimumValidBufferRectForGDC:(BOOL)a3
{
  self->_hasMinimumValidBufferRectForGDC = a3;
}

- (CGRect)minimumValidBufferRectForGDC
{
  double x = self->_minimumValidBufferRectForGDC.origin.x;
  double y = self->_minimumValidBufferRectForGDC.origin.y;
  double width = self->_minimumValidBufferRectForGDC.size.width;
  double height = self->_minimumValidBufferRectForGDC.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMinimumValidBufferRectForGDC:(CGRect)a3
{
  self->_minimumValidBufferRectForGDC = a3;
}

- (double)finalAspectRatio
{
  return self->_finalAspectRatio;
}

- (void)setFinalAspectRatio:(double)a3
{
  self->_finalAspectRatio = a3;
}

- (BOOL)idcProcessingCandidate
{
  return self->_idcProcessingCandidate;
}

- (void)setIdcProcessingCandidate:(BOOL)a3
{
  self->_idcProcessingCandidate = a3;
}

- (NSMutableDictionary)zoomRelatedMetadata
{
  return self->_zoomRelatedMetadata;
}

- (void)setZoomRelatedMetadata:(id)a3
{
}

- (BOOL)zoomApplied
{
  return self->_zoomApplied;
}

- (void)setZoomApplied:(BOOL)a3
{
  self->_zoomApplied = a3;
}

- (CGAffineTransform)zoomTransform
{
  long long v3 = *(_OWORD *)&self[8].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[8].tx;
  return self;
}

- (void)setZoomTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_zoomTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_zoomTransform.tdouble x = v4;
  *(_OWORD *)&self->_zoomTransform.a = v3;
}

- (double)opticalCenter
{
  return *(double *)(a1 + 144);
}

- (void)setOpticalCenter:(NRFFrameMetadata *)self
{
  *(void *)self->_opticalCenter = v2;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (__n128)awbGains
{
  return a1[10];
}

- (void)setAwbGains:(NRFFrameMetadata *)self
{
  *(_OWORD *)self->_awbGains = v2;
}

- (__n128)awbSkinGains
{
  return a1[11];
}

- (void)setAwbSkinGains:(NRFFrameMetadata *)self
{
  *(_OWORD *)self->_awbSkinGains = v2;
}

- (__n128)awbSkyGains
{
  return a1[12];
}

- (void)setAwbSkyGains:(NRFFrameMetadata *)self
{
  *(_OWORD *)self->_awbSkyGains = v2;
}

- (float)skinWBWeightForMIWB
{
  return self->_skinWBWeightForMIWB;
}

- (void)setSkinWBWeightForMIWB:(float)a3
{
  self->_skinWBWeightForMIWB = a3;
}

- (float)daylightScore
{
  return self->_daylightScore;
}

- (void)setDaylightScore:(float)a3
{
  self->_daylightScore = a3;
}

- (float)fdAWBChistMixFactor
{
  return self->_fdAWBChistMixFactor;
}

- (void)setFdAWBChistMixFactor:(float)a3
{
  self->_fdAWBChistMixFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_zoomRelatedMetadata, 0);
  objc_storeStrong((id *)&self->_bodies, 0);

  objc_storeStrong((id *)&self->_faces, 0);
}

@end