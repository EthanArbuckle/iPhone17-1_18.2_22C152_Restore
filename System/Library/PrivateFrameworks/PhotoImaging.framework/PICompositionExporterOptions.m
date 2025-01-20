@interface PICompositionExporterOptions
- (BOOL)exportSidecarData;
- (NSString)pairingIdentifier;
- (NUColorSpace)colorSpace;
- (NUPriority)priority;
- (NUScalePolicy)scalePolicy;
- (PIBrushStrokeHistory)brushStrokeHistory;
- (PICompositionExporterOptions)init;
- (id)description;
- (void)setBrushStrokeHistory:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setExportSidecarData:(BOOL)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setPriority:(id)a3;
- (void)setScalePolicy:(id)a3;
@end

@implementation PICompositionExporterOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brushStrokeHistory, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_priority, 0);
}

- (void)setBrushStrokeHistory:(id)a3
{
}

- (PIBrushStrokeHistory)brushStrokeHistory
{
  return (PIBrushStrokeHistory *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExportSidecarData:(BOOL)a3
{
  self->_exportSidecarData = a3;
}

- (BOOL)exportSidecarData
{
  return self->_exportSidecarData;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPairingIdentifier:(id)a3
{
}

- (NSString)pairingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPriority:(id)a3
{
}

- (NUPriority)priority
{
  return (NUPriority *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p - priority: %@, color space: %@, scale policy: %@>", objc_opt_class(), self, self->_priority, self->_colorSpace, self->_scalePolicy];
}

- (PICompositionExporterOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)PICompositionExporterOptions;
  v2 = [(PICompositionExporterOptions *)&v10 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:3];
  priority = v2->_priority;
  v2->_priority = (NUPriority *)v3;

  uint64_t v5 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];
  colorSpace = v2->_colorSpace;
  v2->_colorSpace = (NUColorSpace *)v5;

  uint64_t v7 = [MEMORY[0x1E4F7A478] oneToOneScalePolicy];
  scalePolicy = v2->_scalePolicy;
  v2->_scalePolicy = (NUScalePolicy *)v7;

  return v2;
}

@end