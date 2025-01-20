@interface PKPrinterDescription
+ (BOOL)supportsSecureCoding;
+ (id)attributesRequiredForPKPaperList;
+ (id)standardRequestedAttributes;
+ (id)txtRecordReconstructingAttributes;
- (BOOL)_calcPrintScalingSupported:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)pin_required;
- (BOOL)print_scaling_supported;
- (BOOL)supportsPrintColorMode;
- (BOOL)type_has_color;
- (BOOL)type_has_duplex;
- (BOOL)wantsComprehensivePaperList;
- (NSArray)attrs_media_source_supported;
- (NSArray)finishingTemplates;
- (NSArray)finishings;
- (NSArray)formats;
- (NSArray)inputSlots;
- (NSArray)jobPresets;
- (NSArray)mediaColSupportedArray;
- (NSArray)mediaTypes;
- (NSArray)orientations;
- (NSArray)outputBins;
- (NSArray)outputModes;
- (NSArray)quality;
- (NSArray)sides;
- (NSArray)trays;
- (NSDictionary)dids;
- (NSDictionary)specialFeedOrientation;
- (NSDictionary)translations;
- (NSSet)attrs_document_format_supported;
- (NSSet)attrs_printer_native_formats;
- (NSSet)jpegFeatures;
- (NSSet)mandatoryJobAttributes;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)deviceID;
- (NSString)driverformat;
- (NSURL)printerInfoURL;
- (NSURL)quotaManagementURL;
- (NSURL)suppliesInfoURL;
- (PKPaperList)paperList;
- (PKPrinterDescription)initWithAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4;
- (PKPrinterDescription)initWithAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 txtRecord:(id)a4 translations:(id)a5;
- (PKPrinterDescription)initWithCoder:(id)a3;
- (PKPrinterDescription)initWithTXT:(id)a3;
- (PKPrinterDescription)initWithUserCodableDictionary:(id)a3;
- (id)_calcDeviceID:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calcFinishingTemplates:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calcInputSlots:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calcJobPresets:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calcMediaTypes:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calcOutputBins:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calcSpecialFeedOrientation:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calculateFormats:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calculateMediaColSupportedArray:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calculateOutputModes:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calculatePaperList:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calculateQuality:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_calculateSides:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (id)_makePrinterDeviceIDFromTxt;
- (id)makeTXTRecordWithURL:(id)a3;
- (id)printInfoSupportedDictionary;
- (id)txtRecordObjectForKey:(id)a3;
- (id)userCodableDictionary;
- (int)documentPasswordSupported;
- (int)identifyActions;
- (int)max_jpeg;
- (int)max_jpeg_x;
- (int)max_jpeg_y;
- (int)max_pdf;
- (int)preferred_landscape;
- (int64_t)_calcJobAccountIDSupport:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (unint64_t)_calcIdentifyActions:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (unint64_t)jobAccountIDSupport;
- (unint64_t)printer_type_from_cups_scalar;
- (void)_calcPrinterDriverInfo:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (void)_ingestAttrs:(const GET_PRINTER_ATTRIBUTES_Response *)a3;
- (void)_ingestTxtRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)replacePaperList:(id)a3;
- (void)visitProperties:(Visitor *)a3;
@end

@implementation PKPrinterDescription

+ (id)standardRequestedAttributes
{
  v4[33] = *MEMORY[0x263EF8340];
  v4[0] = IPPNomenclature::keyCopiesSupported;
  v4[1] = IPPNomenclature::keyDocumentFormatSupported;
  v4[2] = IPPNomenclature::keyDocumentPasswordSupported;
  v4[3] = IPPNomenclature::keyFinishingsColDatabase;
  v4[4] = IPPNomenclature::keyFinishingsSupported;
  v4[5] = IPPNomenclature::keyOutputBinDefault;
  v4[6] = IPPNomenclature::keyPrinterOutputTray;
  v4[7] = IPPNomenclature::keyOutputBinSupported;
  v4[8] = IPPNomenclature::keyIdentifyActionsSupported;
  v4[9] = IPPNomenclature::keyJobAccountIDSupported;
  v4[10] = IPPNomenclature::keyJpegFeaturesSupported;
  v4[11] = IPPNomenclature::keyJpegKOctetsSupported;
  v4[12] = IPPNomenclature::keyJpegXDimensionSupported;
  v4[13] = IPPNomenclature::keyJpegYDimensionSupported;
  v4[14] = IPPNomenclature::keyLandscapeOrientationRequestedPreferred;
  v4[15] = IPPNomenclature::keyMediaColSupported;
  v4[16] = IPPNomenclature::keyMediaSourceSupported;
  v4[17] = IPPNomenclature::keyMediaColReady;
  v4[18] = IPPNomenclature::keyOperationsSupported;
  v4[19] = IPPNomenclature::keyPdfKOctetsSupported;
  v4[20] = IPPNomenclature::keyPrintColorModeSupported;
  v4[21] = IPPNomenclature::keyPrintQualitySupported;
  v4[22] = IPPNomenclature::keyPrintScalingSupported;
  v4[23] = IPPNomenclature::keyPrinterChargeInfoUri;
  v4[24] = IPPNomenclature::keyPrinterInputTray;
  v4[25] = IPPNomenclature::keyMediaTypeSupported;
  v4[26] = IPPNomenclature::keyPrinterMandatoryJobAttributes;
  v4[27] = IPPNomenclature::keyPrinterStateReasons;
  v4[28] = IPPNomenclature::keySidesSupported;
  v4[29] = IPPNomenclature::keyJobPresetsSupported;
  v4[30] = IPPNomenclature::keyPrinterMoreInfo;
  v4[31] = IPPNomenclature::keyPrinterSupplyInfoURI;
  v4[32] = IPPNomenclature::keyPrinterStringsURI;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:33];

  return v2;
}

+ (id)txtRecordReconstructingAttributes
{
  v4[13] = *MEMORY[0x263EF8340];
  v4[0] = IPPNomenclature::keyDocumentFormatSupported;
  v4[1] = IPPNomenclature::keyOutputModeSupported;
  v4[2] = IPPNomenclature::keyPrintColorModeSupported;
  v4[3] = IPPNomenclature::keyPrinterDNS_SD_Name;
  v4[4] = IPPNomenclature::keyPrinterKind;
  v4[5] = IPPNomenclature::keyPrinterLocation;
  v4[6] = IPPNomenclature::keyPrinterMakeAndModel;
  v4[7] = IPPNomenclature::keyPrinterMoreInfo;
  v4[8] = IPPNomenclature::keyPrinterName;
  v4[9] = IPPNomenclature::keyPrinterUUID;
  v4[10] = IPPNomenclature::keySidesSupported;
  v4[11] = IPPNomenclature::keyURFSupported;
  v4[12] = IPPNomenclature::keyURIAuthenticationSupported;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:13];

  return v2;
}

- (id)printInfoSupportedDictionary
{
  v3 = objc_opt_new();
  v4 = v3;
  sides = self->_sides;
  if (sides) {
    [v3 setObject:sides forKeyedSubscript:@"sides"];
  }
  orientations = self->_orientations;
  if (orientations) {
    [v4 setObject:orientations forKeyedSubscript:@"orientation-requested"];
  }
  quality = self->_quality;
  if (quality) {
    [v4 setObject:quality forKeyedSubscript:@"print-quality"];
  }
  formats = self->_formats;
  if (formats) {
    [v4 setObject:formats forKeyedSubscript:@"document-format"];
  }
  mediaColSupportedArray = self->_mediaColSupportedArray;
  if (mediaColSupportedArray) {
    [v4 setObject:mediaColSupportedArray forKeyedSubscript:@"media-col-supported"];
  }
  v10 = [NSNumber numberWithBool:self->_supportsPrintColorMode];
  [v4 setObject:v10 forKeyedSubscript:@"com.apple.supportsPrintColorMode"];

  outputModes = self->_outputModes;
  if (outputModes) {
    [v4 setObject:outputModes forKeyedSubscript:@"print-color-mode"];
  }
  finishings = self->_finishings;
  if (finishings) {
    [v4 setObject:finishings forKeyedSubscript:@"com.apple.finishings"];
  }
  finishingTemplates = self->_finishingTemplates;
  if (finishingTemplates) {
    [v4 setObject:finishingTemplates forKeyedSubscript:@"com.apple.finishingTemplate"];
  }
  outputBins = self->_outputBins;
  if (outputBins) {
    [v4 setObject:outputBins forKeyedSubscript:@"com.apple.outputBin"];
  }
  inputSlots = self->_inputSlots;
  if (inputSlots) {
    [v4 setObject:inputSlots forKeyedSubscript:@"com.apple.inputSlot"];
  }
  mediaTypes = self->_mediaTypes;
  if (mediaTypes) {
    [v4 setObject:mediaTypes forKeyedSubscript:@"com.apple.mediaType"];
  }
  jobPresets = self->_jobPresets;
  if (jobPresets) {
    [v4 setObject:jobPresets forKeyedSubscript:@"com.apple.jobPreset"];
  }
  printerInfoURL = self->_printerInfoURL;
  if (printerInfoURL) {
    [v4 setObject:printerInfoURL forKeyedSubscript:@"PrinterInfoURL"];
  }
  suppliesInfoURL = self->_suppliesInfoURL;
  if (suppliesInfoURL) {
    [v4 setObject:suppliesInfoURL forKeyedSubscript:@"PrinterSuppliesURL"];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)PKPrinterDescription;
  v2 = [(PKPrinterDescription *)&v4 description];

  return (NSString *)v2;
}

- (NSString)debugDescription
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__PKPrinterDescription_debugDescription__block_invoke;
  v4[3] = &unk_2649EE578;
  v4[4] = self;
  v4[5] = &v5;
  DescVisitor::visitProperties(self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__PKPrinterDescription_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = NSString;
  id v10 = [*(id *)(a1 + 32) description];
  uint64_t v5 = (*(void (**)(uint64_t))(*(void *)a2 + 208))(a2);
  v6 = (*(void (**)(uint64_t))(*(void *)a2 + 200))(a2);
  uint64_t v7 = [v4 stringWithFormat:@"%@ Encoded classes: %@, properties %@", v10, v5, v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"type_has_duplex", &self->_type_has_duplex);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"type_has_color", &self->_type_has_color);
  (*((void (**)(Visitor *, __CFString *, NSSet **))a3->var0 + 16))(a3, @"attrs_document_format_supported", &self->_attrs_document_format_supported);
  (*((void (**)(Visitor *, __CFString *, NSSet **))a3->var0 + 16))(a3, @"attrs_printer_native_formats", &self->_attrs_printer_native_formats);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"attrs_media_source_supported", &self->_attrs_media_source_supported);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"driverformat", &self->_driverformat);
  (*((void (**)(Visitor *, __CFString *, NSSet **))a3->var0 + 16))(a3, @"jpegFeatures", &self->_jpegFeatures);
  (*((void (**)(Visitor *, __CFString *, NSSet **))a3->var0 + 16))(a3, @"mandatoryJobAttributes", &self->_mandatoryJobAttributes);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"documentPasswordSupported", &self->_documentPasswordSupported);
  (*((void (**)(Visitor *, __CFString *, unint64_t *))a3->var0 + 6))(a3, @"jobAccountIDSupport", &self->_jobAccountIDSupport);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"max_pdf", &self->_max_pdf);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"max_jpeg", &self->_max_jpeg);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"max_jpeg_x", &self->_max_jpeg_x);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"max_jpeg_y", &self->_max_jpeg_y);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"preferred_landscape", &self->_preferred_landscape);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"print_scaling_supported", &self->_print_scaling_supported);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"pin_required", &self->_pin_required);
  (*((void (**)(Visitor *, __CFString *, unint64_t *))a3->var0 + 6))(a3, @"printer_type_from_cups_scalar", &self->_printer_type_from_cups_scalar);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"identifyActions", &self->_identifyActions);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"sides", &self->_sides);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"orientations", &self->_orientations);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"quality", &self->_quality);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"formats", &self->_formats);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"mediaColSupportedArray", &self->_mediaColSupportedArray);
  (*((void (**)(Visitor *, __CFString *, NSDictionary **))a3->var0 + 18))(a3, @"specialFeedOrientation", &self->_specialFeedOrientation);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"supportsPrintColorMode", &self->_supportsPrintColorMode);
  (*((void (**)(Visitor *, __CFString *, PKPaperList **))a3->var0 + 20))(a3, @"paperList", &self->_paperList);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 15))(a3, @"outputModes", &self->_outputModes);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 14))(a3, @"finishings", &self->_finishings);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 17))(a3, @"finishingTemplates", &self->_finishingTemplates);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 17))(a3, @"outputBins", &self->_outputBins);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 22))(a3, @"trays", &self->_trays);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 17))(a3, @"inputSlots", &self->_inputSlots);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 17))(a3, @"mediaTypes", &self->_mediaTypes);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 17))(a3, @"jobPresets", &self->_jobPresets);
  (*((void (**)(Visitor *, __CFString *, NSURL **))a3->var0 + 8))(a3, @"printerInfoURL", &self->_printerInfoURL);
  (*((void (**)(Visitor *, __CFString *, NSURL **))a3->var0 + 8))(a3, @"suppliesInfoURL", &self->_suppliesInfoURL);
  (*((void (**)(Visitor *, __CFString *, NSURL **))a3->var0 + 8))(a3, @"quotaManagementURL", &self->_quotaManagementURL);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"deviceID", &self->_deviceID);
  (*((void (**)(Visitor *, __CFString *, NSDictionary **))a3->var0 + 12))(a3, @"dids", &self->_dids);
  (*((void (**)(Visitor *, __CFString *, NSDictionary **))a3->var0 + 12))(a3, @"translations", &self->_translations);
  uint64_t v5 = (void (*)(Visitor *))*((void *)a3->var0 + 24);

  v5(a3);
}

- (PKPrinterDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPrinterDescription;
  uint64_t v5 = [(PKPrinterDescription *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"_txtRecord"];
    txtRecord = v5->_txtRecord;
    v5->_txtRecord = (NSDictionary *)v7;

    DecodeVisitor::visitProperties(v5, v4);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  txtRecord = self->_txtRecord;
  if (txtRecord) {
    [v5 encodeObject:txtRecord forKey:@"_txtRecord"];
  }
  EncodeVisitor::visitProperties(self, v5);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__PKPrinterDescription_isEqual___block_invoke;
    v7[3] = &unk_2649EE5A0;
    v7[4] = &v8;
    CompareVisitor::visitProperties(self, v4, v7);
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __32__PKPrinterDescription_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 200))(a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)userCodableDictionary
{
  v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__PKPrinterDescription_userCodableDictionary__block_invoke;
  v6[3] = &unk_2649EE4D8;
  id v4 = v3;
  id v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __45__PKPrinterDescription_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a2;
  id v8 = a3;
  v9 = v8;
  if (*a5)
  {
    uint64_t v10 = (*((void (**)(id))v8 + 2))(v8);
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

- (PKPrinterDescription)initWithUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPrinterDescription;
  BOOL v5 = [(PKPrinterDescription *)&v9 init];
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__PKPrinterDescription_initWithUserCodableDictionary___block_invoke;
    v7[3] = &unk_2649EE4D8;
    id v8 = v4;
    UserCodedSerializationVisitor::visitProperties(v5, (uint64_t)v7);
  }
  return v5;
}

void __54__PKPrinterDescription_initWithUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  id v12 = a2;
  id v8 = a4;
  objc_super v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  if (v9)
  {
    uint64_t v10 = v8[2](v8, v9);
    id v11 = *a5;
    *a5 = (void *)v10;
  }
}

- (id)makeTXTRecordWithURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  [v5 setObject:@"1" forKeyedSubscript:@"txtvers"];
  [v5 setObject:@"1" forKeyedSubscript:@"qtotal"];
  uint64_t v6 = [v4 path];
  [v5 setObject:v6 forKeyedSubscript:@"rp"];

  id v7 = [v5 objectForKeyedSubscript:@"ty"];

  if (v7)
  {
    id v8 = NSString;
    objc_super v9 = [v5 objectForKeyedSubscript:@"ty"];
    uint64_t v10 = [v8 stringWithFormat:@"(%@)", v9];
    [v5 setObject:v10 forKeyedSubscript:@"product"];
  }
  if ([(PKPrinterDescription *)self supportsPrintColorMode]) {
    id v11 = @"T";
  }
  else {
    id v11 = @"F";
  }
  [v5 setObject:v11 forKeyedSubscript:@"color"];
  if ([(PKPrinterDescription *)self type_has_duplex]) {
    id v12 = @"T";
  }
  else {
    id v12 = @"F";
  }
  [v5 setObject:v12 forKeyedSubscript:@"duplex"];
  v13 = [(PKPrinterDescription *)self formats];
  v14 = [v13 componentsJoinedByString:@","];
  [v5 setObject:v14 forKeyedSubscript:@"pdl"];

  v15 = [(PKPrinterDescription *)self deviceID];
  [v5 setObject:v15 forKeyedSubscript:@"urf"];

  v16 = [MEMORY[0x263F08C38] UUID];
  v17 = [v16 UUIDString];

  if (v17)
  {
    if ([v17 hasPrefix:@"urn:uuid:"])
    {
      uint64_t v18 = [v17 substringFromIndex:objc_msgSend(@"urn:uuid:", "length")];

      v17 = (void *)v18;
    }
    [v5 setObject:v17 forKeyedSubscript:@"uuid"];
  }
  v19 = [(PKPrinterDescription *)self dids];
  v20 = [v19 objectForKeyedSubscript:@"MDL"];
  [v5 setObject:v20 forKeyedSubscript:@"display-name"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v21 = [&unk_26E264FB8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(&unk_26E264FB8);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v25 = [v5 objectForKey:v24];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          v27 = _PKLogCategory(PKLogCategoryDiscovery[0]);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v34 = v4;
            __int16 v35 = 2114;
            uint64_t v36 = v24;
            _os_log_impl(&dword_22EA54000, v27, OS_LOG_TYPE_ERROR, "txt record for '%{public}@' does not contain '%{public}@', not AirPrint compliant", buf, 0x16u);
          }

          BOOL v5 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v21 = [&unk_26E264FB8 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return v5;
}

- (BOOL)type_has_duplex
{
  return self->_type_has_duplex;
}

- (BOOL)type_has_color
{
  return self->_type_has_color;
}

- (NSSet)attrs_document_format_supported
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSSet)attrs_printer_native_formats
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)attrs_media_source_supported
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)driverformat
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSSet)jpegFeatures
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (NSSet)mandatoryJobAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (int)documentPasswordSupported
{
  return self->_documentPasswordSupported;
}

- (unint64_t)jobAccountIDSupport
{
  return self->_jobAccountIDSupport;
}

- (int)max_pdf
{
  return self->_max_pdf;
}

- (int)max_jpeg
{
  return self->_max_jpeg;
}

- (int)max_jpeg_x
{
  return self->_max_jpeg_x;
}

- (int)max_jpeg_y
{
  return self->_max_jpeg_y;
}

- (int)preferred_landscape
{
  return self->_preferred_landscape;
}

- (BOOL)print_scaling_supported
{
  return self->_print_scaling_supported;
}

- (BOOL)pin_required
{
  return self->_pin_required;
}

- (unint64_t)printer_type_from_cups_scalar
{
  return self->_printer_type_from_cups_scalar;
}

- (int)identifyActions
{
  return self->_identifyActions;
}

- (NSArray)sides
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)orientations
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)quality
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)formats
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)mediaColSupportedArray
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSDictionary)specialFeedOrientation
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)supportsPrintColorMode
{
  return self->_supportsPrintColorMode;
}

- (PKPaperList)paperList
{
  return (PKPaperList *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)outputModes
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSArray)finishings
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)finishingTemplates
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)outputBins
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (NSArray)trays
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSArray)inputSlots
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (NSArray)mediaTypes
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (NSArray)jobPresets
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (NSURL)printerInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 240, 1);
}

- (NSURL)suppliesInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 248, 1);
}

- (NSURL)quotaManagementURL
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (NSDictionary)dids
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (NSDictionary)translations
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translations, 0);
  objc_storeStrong((id *)&self->_dids, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_quotaManagementURL, 0);
  objc_storeStrong((id *)&self->_suppliesInfoURL, 0);
  objc_storeStrong((id *)&self->_printerInfoURL, 0);
  objc_storeStrong((id *)&self->_jobPresets, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
  objc_storeStrong((id *)&self->_inputSlots, 0);
  objc_storeStrong((id *)&self->_trays, 0);
  objc_storeStrong((id *)&self->_outputBins, 0);
  objc_storeStrong((id *)&self->_finishingTemplates, 0);
  objc_storeStrong((id *)&self->_finishings, 0);
  objc_storeStrong((id *)&self->_outputModes, 0);
  objc_storeStrong((id *)&self->_paperList, 0);
  objc_storeStrong((id *)&self->_specialFeedOrientation, 0);
  objc_storeStrong((id *)&self->_mediaColSupportedArray, 0);
  objc_storeStrong((id *)&self->_formats, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_orientations, 0);
  objc_storeStrong((id *)&self->_sides, 0);
  objc_storeStrong((id *)&self->_mandatoryJobAttributes, 0);
  objc_storeStrong((id *)&self->_jpegFeatures, 0);
  objc_storeStrong((id *)&self->_driverformat, 0);
  objc_storeStrong((id *)&self->_attrs_media_source_supported, 0);
  objc_storeStrong((id *)&self->_attrs_printer_native_formats, 0);
  objc_storeStrong((id *)&self->_attrs_document_format_supported, 0);

  objc_storeStrong((id *)&self->_txtRecord, 0);
}

+ (id)attributesRequiredForPKPaperList
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = IPPNomenclature::keyMediaColReady;
  v4[1] = IPPNomenclature::keyMediaColDatabase;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

- (PKPrinterDescription)initWithAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPrinterDescription;
  id v8 = [(PKPrinterDescription *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_translations, a4);
    [(PKPrinterDescription *)v9 _ingestAttrs:a3];
  }

  return v9;
}

- (PKPrinterDescription)initWithTXT:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrinterDescription;
  BOOL v5 = [(PKPrinterDescription *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(PKPrinterDescription *)v5 _ingestTxtRecord:v4];
  }

  return v6;
}

- (PKPrinterDescription)initWithAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 txtRecord:(id)a4 translations:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPrinterDescription;
  uint64_t v10 = [(PKPrinterDescription *)&v13 init];
  objc_super v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_translations, a5);
    [(PKPrinterDescription *)v11 _ingestTxtRecord:v8];
    [(PKPrinterDescription *)v11 _ingestAttrs:a3];
  }

  return v11;
}

- (id)_calcFinishingTemplates:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v26 = (id)objc_opt_new();
  uint64_t v24 = Printd_Parameters::_get_FinishingsColDatabase(&a3->var0);
  if ([v24 count])
  {
    long long v29 = objc_opt_new();
    v23 = GetLocalizedNameForOption(&cfstr_None.isa, &cfstr_Finishingtempl.isa);
    id v4 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"none", @"finishingTemplateChoice", v23, @"finishingTemplateText", 0);
    [v26 addObject:v4];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v24;
    uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v37 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v9 = [v8 _findAttribute0:@"finishing-template" valueTag:0];
          uint64_t v10 = ippGetIXString(v9, 0);

          if (v10
            && ([v29 containsObject:v10] & 1) == 0
            && [v10 hasPrefix:@"fold-"])
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v11 = [&unk_26E264FD0 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v33;
LABEL_12:
              uint64_t v13 = 0;
              while (1)
              {
                if (*(void *)v33 != v12) {
                  objc_enumerationMutation(&unk_26E264FD0);
                }
                if ([v10 containsString:*(void *)(*((void *)&v32 + 1) + 8 * v13)]) {
                  break;
                }
                if (v11 == ++v13)
                {
                  uint64_t v11 = [&unk_26E264FD0 countByEnumeratingWithState:&v32 objects:v40 count:16];
                  if (v11) {
                    goto LABEL_12;
                  }
                  goto LABEL_18;
                }
              }
            }
            else
            {
LABEL_18:
              [v29 addObject:v10];
              v14 = objc_opt_new();
              v30[0] = MEMORY[0x263EF8330];
              v30[1] = 3221225472;
              v30[2] = __77__PKPrinterDescription_PrintertoolSideConstruction___calcFinishingTemplates___block_invoke;
              v30[3] = &unk_2649EE5C8;
              id v27 = v14;
              id v31 = v27;
              [v8 enumerateAttributes:v30];
              v15 = v10;
              v16 = GetLocalizedNameForOption(v15, &cfstr_Finishingtempl.isa);
              if ([v16 isEqual:v15])
              {
                v17 = [(PKPrinterDescription *)self translations];
                uint64_t v18 = [NSString stringWithFormat:@"finishing-template.%@", v15];
                v19 = [v17 objectForKey:v18];

                if (v19)
                {
                  id v20 = v19;

                  v16 = v20;
                }
              }
              if (([v16 isEqual:v15] & 1) == 0)
              {
                uint64_t v21 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v15, @"finishingTemplateChoice", v16, @"finishingTemplateText", v27, @"finishingTemplateOptions", 0);
                [v26 addObject:v21];
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v5);
    }
  }

  return v26;
}

void __77__PKPrinterDescription_PrintertoolSideConstruction___calcFinishingTemplates___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "value_tag") == 52)
  {
    v3 = [v4 name];
    if ([v3 compare:@"media-size"]) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

- (id)_calcOutputBins:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = Printd_Parameters::_get_OutputBinSupported(&a3->var0);
  if ([v5 count])
  {
    uint64_t v6 = Printd_Parameters::_get_OutputBinDefault(&a3->var0);
    id v7 = Printd_Parameters::_get_PrinterOutputTray(&a3->var0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__PKPrinterDescription_PrintertoolSideConstruction___calcOutputBins___block_invoke;
    v11[3] = &unk_2649EE5F0;
    id v8 = v6;
    id v12 = v8;
    id v13 = v7;
    id v14 = v4;
    id v9 = v7;
    [v5 enumerateObjectsUsingBlock:v11];
  }

  return v4;
}

void __69__PKPrinterDescription_PrintertoolSideConstruction___calcOutputBins___block_invoke(id *a1, void *a2, unint64_t a3)
{
  id v12 = a2;
  uint64_t v5 = objc_opt_new();
  [v5 setObject:v12 forKey:@"OutputBinChoice"];
  uint64_t v6 = [v12 stringByReplacingOccurrencesOfString:@"-" withString:@" "];
  id v7 = [v6 capitalizedString];

  [v5 setObject:v7 forKey:@"OutputBinText"];
  if ([a1[4] isEqualToString:v12]) {
    [v5 setObject:@"YES" forKey:@"DefaultOutputBin"];
  }
  if ([a1[5] count] > a3)
  {
    id v8 = [a1[5] objectAtIndexedSubscript:a3];
    if (v8)
    {
      id v9 = [MEMORY[0x263EFF8F8] dataWithBytes:"stackingorder=firstToLast" length:26];;
      objc_msgSend(v8, "rangeOfData:options:range:", v9, 0, 0, objc_msgSend(v8, "length"));
      if (v10) {
        uint64_t v11 = @"Normal";
      }
      else {
        uint64_t v11 = @"Reverse";
      }
      [v5 setObject:v11 forKey:@"com.apple.pageStackOrder"];
    }
  }
  [a1[6] addObject:v5];
}

- (unint64_t)_calcIdentifyActions:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  Printd_Parameters::_get_IdentifyActionsSupported(&a3->var0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", @"display", (void)v10))
        {
          v4 |= 1uLL;
        }
        else if ([v8 hasPrefix:@"flash"])
        {
          v4 |= 2uLL;
        }
        else if ([v8 hasPrefix:@"sound"])
        {
          v4 |= 4uLL;
        }
        else if ([v8 hasPrefix:@"speak"])
        {
          v4 |= 8uLL;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v4;
}

- (id)_calcSpecialFeedOrientation:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v20 = (id)objc_opt_new();
  Printd_Parameters::_get_MediaColReady(&a3->var0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 mediaSourceProperties];
        if (v9)
        {
          long long v10 = [v8 mediaSize];
          long long v11 = v10;
          if (!v10 || ([v10 hasValidIntegerTypesForXAndY] & 1) == 0) {
            goto LABEL_22;
          }
          uint64_t v12 = [v11 xDimension];
          uint64_t v13 = [v11 yDimension];
          uint64_t v14 = v13;
          if ((int)v12 < 1 || (int)v13 < 1) {
            goto LABEL_22;
          }
          v16 = [v9 feedDirection];
          v17 = [v9 feedOrientation];
          if ([v16 compare:@"long-edge-first"])
          {
            if ([v17 integerValue] == 6)
            {
              if (!v17)
              {
LABEL_21:

LABEL_22:
                goto LABEL_23;
              }
LABEL_19:
              uint64_t v18 = +[PKPaper mediaNameForWidth:v12 height:v14 borderless:0 simplex:0];
              [v20 setObject:v17 forKey:v18];
            }
            goto LABEL_21;
          }
          if (!v17) {
            v17 = &unk_26E264DD8;
          }
          goto LABEL_19;
        }
LABEL_23:
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v20;
}

- (BOOL)_calcPrintScalingSupported:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = Printd_Parameters::_get_PrintScalingSupported(&a3->var0);
  uint64_t v5 = [v3 setWithArray:v4];

  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E264FE8];
  char v7 = [v5 intersectsSet:v6];

  return v7;
}

- (id)_calculateSides:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  id v4 = Printd_Parameters::_get_SidesSupported(&a3->var0);
  if ((unint64_t)[v4 count] > 1)
  {

LABEL_4:
    self->_BOOL type_has_duplex = 1;
    v9[0] = @"one-sided";
    v9[1] = @"two-sided-short-edge";
    v9[2] = @"two-sided-long-edge";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    goto LABEL_5;
  }
  BOOL type_has_duplex = self->_type_has_duplex;

  if (type_has_duplex) {
    goto LABEL_4;
  }
  id v8 = @"one-sided";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
LABEL_5:

  return v6;
}

- (id)_calculateQuality:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = Printd_Parameters::_get_PrintQualitySupported(&a3->var0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__PKPrinterDescription_PrintertoolSideConstruction___calculateQuality___block_invoke;
  v10[3] = &unk_2649EE618;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  if (![v6 count])
  {
    char v7 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_DEFAULT, "No print-quality-supported attribute found.  Defaulting to normal quality.", v9, 2u);
    }

    [v6 addObject:@"4"];
  }

  return v6;
}

void __71__PKPrinterDescription_PrintertoolSideConstruction___calculateQuality___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v3, "integerValue"));
  [v4 addObject:v5];
}

- (id)_calculateFormats:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v5 = Printd_Parameters::_get_DocumentFormatSupported(&a3->var0);
  id v6 = [v4 setWithArray:v5];

  char v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E265000];
  [v6 intersectSet:v7];
  if (![v6 count])
  {
    id v8 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_DEFAULT, "No document-format-supported attribute found or no supported formats found.", buf, 2u);
    }

    id v9 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"pdl"];
    long long v10 = v9;
    if (v9)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = objc_msgSend(v9, "lowercaseString", 0);
      uint64_t v12 = [v11 componentsSeparatedByString:@","];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if ([v7 containsObject:v16]) {
              [v6 addObject:v16];
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v13);
      }
    }
  }
  v17 = +[PKDefaults requiredPDL];
  if (v17 && ([v6 containsObject:v17] & 1) == 0)
  {
    uint64_t v18 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_22EA54000, v18, OS_LOG_TYPE_DEFAULT, "Formats array doesn't contain '%{public}@', which is required; contains: %{public}@",
        buf,
        0x16u);
    }

    id v6 = 0;
  }
  v19 = [v6 allObjects];

  return v19;
}

- (id)_calculateMediaColSupportedArray:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v3 = Printd_Parameters::_get_MediaColSupported(&a3->var0);
  if (![v3 count])
  {
    id v4 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_22EA54000, v4, OS_LOG_TYPE_DEFAULT, "No mediaColSupported found, defaulting to media-bottom-margin, media-left-margin, media-right-margin, media-size, and media-top-margin.", v6, 2u);
    }

    id v3 = &unk_26E265018;
  }

  return v3;
}

- (BOOL)wantsComprehensivePaperList
{
  return self->_wantsComprehensivePaperList;
}

- (void)replacePaperList:(id)a3
{
  self->_wantsComprehensivePaperList = 0;
  objc_storeStrong((id *)&self->_paperList, a3);
}

- (id)_calculatePaperList:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v4 = +[PKPaperList paperListWithAttrs:a3 translations:self->_translations];
  if (!v4)
  {
    uint64_t v5 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_DEFAULT, "would like lazily fetched paperlist", buf, 2u);
    }

    self->_wantsComprehensivePaperList = 1;
    id v4 = +[PKPaperList paperListWithTXTRecord:self->_txtRecord];
    if (!v4)
    {
      id v6 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_ERROR, "Missing txt record sufficent for paper list", v8, 2u);
      }

      id v4 = 0;
    }
  }

  return v4;
}

- (id)_calculateOutputModes:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = Printd_Parameters::_get_PrintColorModeSupported(&a3->var0);
  if (![v4 count])
  {
    if (self->_type_has_color)
    {
      long long v10 = @"monochrome";
      id v11 = @"color";
      uint64_t v5 = &v10;
      uint64_t v6 = 2;
    }
    else
    {
      id v9 = @"monochrome";
      uint64_t v5 = &v9;
      uint64_t v6 = 1;
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12);

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_calcInputSlots:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = self->_trays;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
        long long v10 = [v8 name];
        [v9 setObject:v10 forKey:@"InputSlotChoice"];

        uint64_t v11 = [v8 localizedName];
        [v9 setObject:v11 forKey:@"InputSlotName"];

        uint64_t v12 = [v8 mediaName];
        LOBYTE(v11) = v12 == 0;

        if ((v11 & 1) == 0)
        {
          uint64_t v13 = [v8 mediaName];
          [v9 setObject:v13 forKey:@"InputSlotMedia"];
        }
        [v4 addObject:v9];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v4;
}

- (id)_calcMediaTypes:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v19 = (id)objc_opt_new();
  long long v17 = Printd_Parameters::_get_MediaTypeSupported(&a3->var0);
  if (!v17) {
    goto LABEL_19;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v17;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v4)
  {

LABEL_19:
    v25[0] = @"MediaTypeChoice";
    v25[1] = @"MediaTypeName";
    v26[0] = @"auto";
    v26[1] = @"auto";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v19 insertObject:v15 atIndex:0];

    goto LABEL_20;
  }
  char v5 = 0;
  uint64_t v6 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(NSString **)(*((void *)&v21 + 1) + 8 * i);
      id v9 = GetLocalizedNameForOption(v8, &cfstr_Mediatypenames.isa);
      if ([v9 isEqual:v8])
      {
        long long v10 = [(PKPrinterDescription *)self translations];
        uint64_t v11 = [NSString stringWithFormat:@"media-type.%@", v8];
        uint64_t v12 = [v10 objectForKey:v11];

        if (v12)
        {
          id v13 = v12;

          id v9 = v13;
        }
      }
      if (([v9 isEqual:v8] & 1) == 0)
      {
        v27[0] = @"MediaTypeChoice";
        v27[1] = @"MediaTypeName";
        v28[0] = v8;
        v28[1] = v9;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
        [v19 addObject:v14];

        if ([(NSString *)v8 isEqual:@"auto"]) {
          char v5 = 1;
        }
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  }
  while (v4);

  if ((v5 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_20:

  return v19;
}

- (id)_calcJobPresets:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v23 = (id)objc_opt_new();
  uint64_t v4 = Printd_Parameters::_get_JobPresetsSupported(&a3->var0);
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v9 = objc_opt_new();
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __69__PKPrinterDescription_PrintertoolSideConstruction___calcJobPresets___block_invoke;
          v24[3] = &unk_2649EE5C8;
          id v10 = v9;
          id v25 = v10;
          [v8 enumerateAttributes:v24];
          uint64_t v11 = [v10 objectForKeyedSubscript:@"preset-name"];
          uint64_t v12 = v11;
          if (v11)
          {
            id v13 = v11;
            uint64_t v14 = [(PKPrinterDescription *)self translations];
            uint64_t v15 = [NSString stringWithFormat:@"job-preset.%@", v13];
            long long v16 = [v14 objectForKey:v15];

            id v17 = v13;
            if (v16)
            {
              id v17 = v16;
            }
            long long v18 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v17, @"JobPresetChoice", v10, @"JobPresetOption", 0);
            [v23 addObject:v18];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v5);
    }

    uint64_t v4 = v20;
  }

  return v23;
}

void __69__PKPrinterDescription_PrintertoolSideConstruction___calcJobPresets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(PK_ipp_attribute_t *)v3 name];
  int v5 = [(PK_ipp_attribute_t *)v3 value_tag];
  char v6 = v5 - 33;
  if ((v5 - 33) > 0x23) {
    goto LABEL_7;
  }
  if (((1 << v6) & 0xB00000000) != 0)
  {
    uint64_t v7 = ippGetIXString(v3, 0);
    [*(id *)(a1 + 32) setObject:v7 forKey:v4];

    goto LABEL_12;
  }
  if (((1 << v6) & 5) != 0)
  {
    if ([v4 compare:@"finishings"])
    {
      objc_msgSend(NSNumber, "numberWithInt:", ippGetIXInteger(v3, 0));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = v3;
      uint64_t v11 = objc_opt_new();
      *(void *)uint64_t v12 = MEMORY[0x263EF8330];
      *(void *)&v12[8] = 3221225472;
      *(void *)&v12[16] = ___ZL21convertIPPIntsToArrayP18PK_ipp_attribute_t_block_invoke;
      *(void *)&v12[24] = &unk_2649EBE88;
      id v8 = v11;
      id v13 = v8;
      [(PK_ipp_attribute_t *)v10 enumerateValues:v12];
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v4, *(void *)v12, *(_OWORD *)&v12[8], *(void *)&v12[24]);
  }
  else
  {
LABEL_7:
    id v9 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v12 = 136315650;
      *(void *)&v12[4] = "-[PKPrinterDescription(PrintertoolSideConstruction) _calcJobPresets:]_block_invoke";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = v5;
      *(_WORD *)&v12[18] = 2114;
      *(void *)&v12[20] = v4;
      _os_log_impl(&dword_22EA54000, v9, OS_LOG_TYPE_ERROR, "%s: unhandled valueTag %d for %{public}@", v12, 0x1Cu);
    }
  }
LABEL_12:
}

- (id)_calcDeviceID:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v4 = Printd_Parameters::_get_PrinterDeviceId(&a3->var0);
  if (!v4)
  {
    uint64_t v4 = [(PKPrinterDescription *)self _makePrinterDeviceIDFromTxt];
  }

  return v4;
}

- (int64_t)_calcJobAccountIDSupport:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  mandatoryJobAttributes = self->_mandatoryJobAttributes;
  if (mandatoryJobAttributes
    && [(NSSet *)mandatoryJobAttributes containsObject:@"job-account-id"])
  {
    return 1;
  }
  if (!Printd_Parameters::_has_JobAccountIDSupported(&a3->var0)) {
    return 0;
  }
  if (Printd_Parameters::_get_JobAccountIDSupported(&a3->var0)) {
    return 2;
  }
  return 0;
}

- (void)_calcPrinterDriverInfo:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  bzero(v14, 0x838uLL);
  *(void *)&long long v16 = [(PKPrinterDescription *)self printer_type_from_cups_scalar];
  uint64_t v4 = [(PKPrinterDescription *)self dids];
  char v5 = liteFigureOutDriverSetupInfo((uint64_t)&v16, (uint64_t)v14, v4);

  if (v5)
  {
    char v6 = [MEMORY[0x263EFFA08] setWithArray:*((void *)&v16 + 1)];
    attrs_document_format_supported = self->_attrs_document_format_supported;
    self->_attrs_document_format_supported = v6;

    id v8 = [MEMORY[0x263EFFA08] setWithArray:(void)v17];
    attrs_printer_native_formats = self->_attrs_printer_native_formats;
    self->_attrs_printer_native_formats = v8;

    objc_storeStrong((id *)&self->_attrs_media_source_supported, *((id *)&v17 + 1));
    id v10 = v18;
    self->_printer_type_from_cups_scalar = v16;
    uint64_t v11 = (NSString *)v10;
    driverformat = self->_driverformat;
    self->_driverformat = v11;
  }
  else
  {
    driverformat = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(driverformat, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_22EA54000, driverformat, OS_LOG_TYPE_ERROR, "Driver initialization failed.", v13, 2u);
    }
  }
}

- (id)_makePrinterDeviceIDFromTxt
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v35 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"URF"];
  long long v33 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"usb_MFG"];
  uint64_t v2 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"usb_MDL"];
  long long v32 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"product"];
  if (v33 || !v32) {
    goto LABEL_12;
  }
  if ([v32 rangeOfString:@"DesignJet" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v32 rangeOfString:@"DeskJet" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v32 rangeOfString:@"LaserJet" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v33 = @"HP";
    if ([v32 rangeOfString:@"Photosmart" options:1] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    uint64_t v3 = [v32 rangeOfString:@"OfficeJet" options:1];
    uint64_t v4 = @"HP";
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v4 = @"Unknown";
    }
  }
  else
  {
    uint64_t v4 = @"HP";
  }
  long long v33 = v4;
LABEL_12:
  if (v2) {
    char v5 = (__CFString *)v2;
  }
  else {
    char v5 = @"Unknown";
  }
  uint64_t v30 = v5;
  if (!v2 && v32) {
    uint64_t v30 = v32;
  }
  long long v34 = v33;
  char v6 = (const char *)[(__CFString *)v34 UTF8String];
  long long v29 = v30;
  snprintf(__str, 0x400uLL, "MFG:%s;MDL:%s;CMD", v6, (const char *)[(__CFString *)v29 UTF8String]);
  if (-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid)
  {
    if (-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF)
    {
LABEL_20:
      strlcat(__str, ":URF", 0x400uLL);
      goto LABEL_42;
    }
  }
  else
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PrintKitAlwaysURF", @".GlobalPreferences", (Boolean *)&-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid);
    if (-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid) {
      int v8 = AppBooleanValue;
    }
    else {
      int v8 = 0;
    }
    -[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF = v8;
    -[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid = 1;
    if (v8) {
      goto LABEL_20;
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = self->_formats;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = ":";
    uint64_t v12 = *(void *)v39;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
        strlcat(__str, v11, 0x400uLL);
        char v15 = [v14 isEqual:@"image/jpeg"];
        long long v16 = "JPEG";
        if (v15) {
          goto LABEL_36;
        }
        char v17 = [v14 isEqual:@"application/pdf"];
        long long v16 = "PDF";
        if (v17) {
          goto LABEL_36;
        }
        char v18 = [v14 isEqual:@"image/png"];
        long long v16 = "PNG";
        if ((v18 & 1) != 0
          || (v19 = [v14 isEqual:@"application/postscript"], long long v16 = "PS", (v19 & 1) != 0)
          || (char v20 = [v14 isEqual:@"application/vnd.hp-pcl"], v16 = "PCL", (v20 & 1) != 0)
          || (int v21 = [v14 isEqual:@"image/urf"], v16 = "URF", v21))
        {
LABEL_36:
          strlcat(__str, v16, 0x400uLL);
        }
        else
        {
          strlcat(__str, (const char *)[v14 UTF8String], 0x400uLL);
        }
        ++v13;
        uint64_t v11 = ",";
      }
      while (v10 != v13);
      uint64_t v22 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      uint64_t v10 = v22;
      uint64_t v11 = ",";
    }
    while (v22);
  }

LABEL_42:
  strlcat(__str, ";", 0x400uLL);
  id v23 = v35;
  if (!v35) {
    id v23 = @"CP1,RS300,W8,SRGB24";
  }
  id v36 = v23;
  long long v24 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"printer-type"];
  BOOL v25 = v24 == 0;

  if (!v25)
  {
    uint64_t v26 = [v36 stringByReplacingOccurrencesOfString:@"CP1," withString:@"CP255,"];

    id v36 = (id)v26;
  }
  strlcat(__str, "URF:", 0x400uLL);
  id v37 = v36;
  strlcat(__str, (const char *)[v37 UTF8String], 0x400uLL);
  strlcat(__str, ";", 0x400uLL);
  long long v27 = [NSString stringWithUTF8String:__str];

  return v27;
}

- (id)txtRecordObjectForKey:(id)a3
{
  txtRecord = self->_txtRecord;
  uint64_t v4 = [a3 lowercaseString];
  char v5 = [(NSDictionary *)txtRecord objectForKey:v4];

  return v5;
}

- (void)_ingestTxtRecord:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = ___ZL20ensureLowercasedKeysP12NSDictionaryIP8NSStringS1_E_block_invoke;
  v11[3] = &unk_2649EE528;
  char v6 = v5;
  uint64_t v12 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  txtRecord = self->_txtRecord;
  self->_txtRecord = v6;

  int v8 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"Color"];
  id v9 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"Duplex"];
  uint64_t v10 = [(PKPrinterDescription *)self txtRecordObjectForKey:@"product"];
  if (v8 && ([v8 isEqual:@"T"] & 1) != 0
    || v10 && [v10 rangeOfString:@"Color"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_type_has_color = 1;
  }
  if (v9 && [v9 isEqual:@"T"]) {
    self->_BOOL type_has_duplex = 1;
  }
}

- (void)_ingestAttrs:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  v65[2] = *MEMORY[0x263EF8340];
  if (Printd_Parameters::_has_CopiesSupported(&a3->var0))
  {
    Printd_Parameters::_get_CopiesSupported(&a3->var0, &v64);
    if (SHIDWORD(v64) >= 2) {
      self->_printer_type_from_cups_scalar |= 4uLL;
    }
  }
  if (Printd_Parameters::_has_JpegFeaturesSupported(&a3->var0))
  {
    char v5 = (void *)MEMORY[0x263EFFA08];
    char v6 = Printd_Parameters::_get_JpegFeaturesSupported(&a3->var0);
    uint64_t v7 = [v5 setWithArray:v6];
    jpegFeatures = self->_jpegFeatures;
    self->_jpegFeatures = v7;
  }
  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = Printd_Parameters::_get_PrinterMandatoryJobAttributes(&a3->var0);
  uint64_t v11 = [v9 setWithArray:v10];
  mandatoryJobAttributes = self->_mandatoryJobAttributes;
  self->_mandatoryJobAttributes = v11;

  self->_documentPasswordSupported = 0;
  if (Printd_Parameters::_has_DocumentPasswordSupported(&a3->var0)) {
    self->_documentPasswordSupported = Printd_Parameters::_has_DocumentPasswordSupported(&a3->var0);
  }
  self->_jobAccountIDSupport = [(PKPrinterDescription *)self _calcJobAccountIDSupport:a3];
  if (Printd_Parameters::_has_PdfKOctetsSupported(&a3->var0))
  {
    Printd_Parameters::_get_PdfKOctetsSupported(&a3->var0, &v64);
    self->_max_pdf = HIDWORD(v64);
  }
  if (Printd_Parameters::_has_JpegKOctetsSupported(&a3->var0))
  {
    Printd_Parameters::_get_JpegKOctetsSupported(&a3->var0, &v64);
    self->_max_jpeg = HIDWORD(v64);
  }
  if (Printd_Parameters::_has_JpegXDimensionSupported(&a3->var0))
  {
    Printd_Parameters::_get_JpegXDimensionSupported(&a3->var0, &v64);
    self->_max_jpeg_x = HIDWORD(v64);
  }
  if (Printd_Parameters::_has_JpegYDimensionSupported(&a3->var0))
  {
    Printd_Parameters::_get_JpegYDimensionSupported(&a3->var0, &v64);
    self->_max_jpeg_y = HIDWORD(v64);
  }
  self->_preferred_landscape = 4;
  uint64_t v13 = @"4";
  if (Printd_Parameters::_has_LandscapeOrientationRequestedPreferred(&a3->var0)
    && Printd_Parameters::_get_LandscapeOrientationRequestedPreferred(&a3->var0) == 5)
  {
    uint64_t v14 = @"5";

    self->_preferred_landscape = 5;
    uint64_t v13 = v14;
  }
  v65[0] = @"3";
  v65[1] = v13;
  char v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
  orientations = self->_orientations;
  self->_orientations = v15;

  char v17 = [(PKPrinterDescription *)self _calcSpecialFeedOrientation:a3];
  specialFeedOrientation = self->_specialFeedOrientation;
  self->_specialFeedOrientation = v17;

  self->_print_scaling_supported = [(PKPrinterDescription *)self _calcPrintScalingSupported:a3];
  char v19 = [(PKPrinterDescription *)self _calculateSides:a3];
  sides = self->_sides;
  self->_sides = v19;

  int v21 = [(PKPrinterDescription *)self _calculateQuality:a3];
  quality = self->_quality;
  self->_quality = v21;

  id v23 = [(PKPrinterDescription *)self _calculateFormats:a3];
  formats = self->_formats;
  self->_formats = v23;

  BOOL v25 = [(PKPrinterDescription *)self _calculateMediaColSupportedArray:a3];
  mediaColSupportedArray = self->_mediaColSupportedArray;
  self->_mediaColSupportedArray = v25;

  long long v27 = Printd_Parameters::_get_PrintColorModeSupported(&a3->var0);
  self->_supportsPrintColorMode = [v27 count] != 0;

  long long v28 = [(PKPrinterDescription *)self _calculatePaperList:a3];
  paperList = self->_paperList;
  self->_paperList = v28;

  uint64_t v30 = [(PKPrinterDescription *)self _calculateOutputModes:a3];
  outputModes = self->_outputModes;
  self->_outputModes = v30;

  Printd_Parameters::_get_FinishingsSupported(&a3->var0);
  long long v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
  finishings = self->_finishings;
  self->_finishings = v32;

  long long v34 = [(PKPrinterDescription *)self _calcFinishingTemplates:a3];
  finishingTemplates = self->_finishingTemplates;
  self->_finishingTemplates = v34;

  id v36 = [(PKPrinterDescription *)self _calcOutputBins:a3];
  outputBins = self->_outputBins;
  self->_outputBins = v36;

  long long v38 = Printd_Parameters::_get_MediaSourceSupported(&a3->var0);
  long long v39 = Printd_Parameters::_get_PrinterInputTray(&a3->var0);
  long long v40 = +[PKTray traysWithMediaSourceSupported:v38 printerInputTrays:v39];
  trays = self->_trays;
  self->_trays = v40;

  uint64_t v42 = [(PKPrinterDescription *)self _calcInputSlots:a3];
  inputSlots = self->_inputSlots;
  self->_inputSlots = v42;

  uint64_t v44 = [(PKPrinterDescription *)self _calcMediaTypes:a3];
  mediaTypes = self->_mediaTypes;
  self->_mediaTypes = v44;

  v46 = [(PKPrinterDescription *)self _calcJobPresets:a3];
  jobPresets = self->_jobPresets;
  self->_jobPresets = v46;

  Printd_Parameters::_get_PrinterMoreInfo(&a3->var0);
  v48 = (NSURL *)objc_claimAutoreleasedReturnValue();
  printerInfoURL = self->_printerInfoURL;
  self->_printerInfoURL = v48;

  Printd_Parameters::_get_PrinterSupplyInfoURI(&a3->var0);
  v50 = (NSURL *)objc_claimAutoreleasedReturnValue();
  suppliesInfoURL = self->_suppliesInfoURL;
  self->_suppliesInfoURL = v50;

  Printd_Parameters::_get_PrinterChargeInfoUri(&a3->var0);
  v52 = (NSURL *)objc_claimAutoreleasedReturnValue();
  quotaManagementURL = self->_quotaManagementURL;
  self->_quotaManagementURL = v52;

  self->_identifyActions = [(PKPrinterDescription *)self _calcIdentifyActions:a3];
  v54 = [(PKPrinterDescription *)self _calcDeviceID:a3];
  deviceID = self->_deviceID;
  self->_deviceID = v54;

  v56 = self->_deviceID;
  if (v56)
  {
    _cupsGet1284Values(v56);
    v57 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    p_dids = &self->_dids;
    dids = self->_dids;
    self->_dids = v57;
  }
  else
  {
    p_dids = &self->_dids;
    dids = self->_dids;
    self->_dids = 0;
  }

  v60 = [(NSDictionary *)*p_dids objectForKey:@"TEST-PIN-REQUIRED"];
  BOOL v61 = v60 == 0;

  if (!v61) {
    self->_pin_required = 1;
  }
  [(PKPrinterDescription *)self _calcPrinterDriverInfo:a3];
  v62 = [(NSDictionary *)*p_dids objectForKey:@"TEST-FAX"];
  BOOL v63 = v62 == 0;

  if (!v63) {
    self->_printer_type_from_cups_scalar |= 0x80uLL;
  }
}

@end