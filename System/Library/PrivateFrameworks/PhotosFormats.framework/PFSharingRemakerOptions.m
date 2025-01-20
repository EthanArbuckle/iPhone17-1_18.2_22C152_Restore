@interface PFSharingRemakerOptions
- (BOOL)shouldConvertToSRGB;
- (BOOL)shouldStripAccessibilityDescription;
- (BOOL)shouldStripAllMetadata;
- (BOOL)shouldStripCaption;
- (BOOL)shouldStripLocation;
- (CLLocation)customLocation;
- (NSDate)customDate;
- (NSString)customAccessibilityLabel;
- (NSString)customCaption;
- (NSString)exportFileType;
- (NSString)exportPreset;
- (NSString)outputFilename;
- (NSURL)outputDirectoryURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCustomAccessibilityLabel:(id)a3;
- (void)setCustomCaption:(id)a3;
- (void)setCustomDate:(id)a3;
- (void)setCustomLocation:(id)a3;
- (void)setExportFileType:(id)a3;
- (void)setExportPreset:(id)a3;
- (void)setOutputDirectoryURL:(id)a3;
- (void)setOutputFilename:(id)a3;
- (void)setShouldConvertToSRGB:(BOOL)a3;
- (void)setShouldStripAccessibilityDescription:(BOOL)a3;
- (void)setShouldStripAllMetadata:(BOOL)a3;
- (void)setShouldStripCaption:(BOOL)a3;
- (void)setShouldStripLocation:(BOOL)a3;
@end

@implementation PFSharingRemakerOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportFileType, 0);
  objc_storeStrong((id *)&self->_exportPreset, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customCaption, 0);
  objc_storeStrong((id *)&self->_customDate, 0);

  objc_storeStrong((id *)&self->_customLocation, 0);
}

- (void)setExportFileType:(id)a3
{
}

- (NSString)exportFileType
{
  return self->_exportFileType;
}

- (void)setExportPreset:(id)a3
{
}

- (NSString)exportPreset
{
  return self->_exportPreset;
}

- (void)setOutputFilename:(id)a3
{
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (void)setOutputDirectoryURL:(id)a3
{
}

- (NSURL)outputDirectoryURL
{
  return self->_outputDirectoryURL;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  self->_shouldStripAccessibilityDescription = a3;
}

- (BOOL)shouldStripAccessibilityDescription
{
  return self->_shouldStripAccessibilityDescription;
}

- (void)setCustomCaption:(id)a3
{
}

- (NSString)customCaption
{
  return self->_customCaption;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  self->_shouldStripCaption = a3;
}

- (BOOL)shouldStripCaption
{
  return self->_shouldStripCaption;
}

- (void)setCustomDate:(id)a3
{
}

- (NSDate)customDate
{
  return self->_customDate;
}

- (void)setCustomLocation:(id)a3
{
}

- (CLLocation)customLocation
{
  return self->_customLocation;
}

- (void)setShouldConvertToSRGB:(BOOL)a3
{
  self->_shouldConvertToSRGB = a3;
}

- (BOOL)shouldConvertToSRGB
{
  return self->_shouldConvertToSRGB;
}

- (void)setShouldStripAllMetadata:(BOOL)a3
{
  self->_shouldStripAllMetadata = a3;
}

- (BOOL)shouldStripAllMetadata
{
  return self->_shouldStripAllMetadata;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  self->_shouldStripLocation = a3;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PFSharingRemakerOptions);
  [(PFSharingRemakerOptions *)v4 setShouldStripLocation:[(PFSharingRemakerOptions *)self shouldStripLocation]];
  [(PFSharingRemakerOptions *)v4 setShouldStripCaption:[(PFSharingRemakerOptions *)self shouldStripCaption]];
  [(PFSharingRemakerOptions *)v4 setShouldStripAccessibilityDescription:[(PFSharingRemakerOptions *)self shouldStripAccessibilityDescription]];
  [(PFSharingRemakerOptions *)v4 setShouldStripAllMetadata:[(PFSharingRemakerOptions *)self shouldStripAllMetadata]];
  [(PFSharingRemakerOptions *)v4 setShouldConvertToSRGB:[(PFSharingRemakerOptions *)self shouldConvertToSRGB]];
  v5 = [(PFSharingRemakerOptions *)self customLocation];
  [(PFSharingRemakerOptions *)v4 setCustomLocation:v5];

  v6 = [(PFSharingRemakerOptions *)self customDate];
  [(PFSharingRemakerOptions *)v4 setCustomDate:v6];

  v7 = [(PFSharingRemakerOptions *)self customCaption];
  [(PFSharingRemakerOptions *)v4 setCustomCaption:v7];

  v8 = [(PFSharingRemakerOptions *)self customAccessibilityLabel];
  [(PFSharingRemakerOptions *)v4 setCustomAccessibilityLabel:v8];

  v9 = [(PFSharingRemakerOptions *)self outputDirectoryURL];
  [(PFSharingRemakerOptions *)v4 setOutputDirectoryURL:v9];

  v10 = [(PFSharingRemakerOptions *)self outputFilename];
  [(PFSharingRemakerOptions *)v4 setOutputFilename:v10];

  v11 = [(PFSharingRemakerOptions *)self exportPreset];
  [(PFSharingRemakerOptions *)v4 setExportPreset:v11];

  v12 = [(PFSharingRemakerOptions *)self exportFileType];
  [(PFSharingRemakerOptions *)v4 setExportFileType:v12];

  return v4;
}

@end