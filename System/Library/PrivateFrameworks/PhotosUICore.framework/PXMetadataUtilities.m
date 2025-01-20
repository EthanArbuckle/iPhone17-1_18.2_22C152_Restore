@interface PXMetadataUtilities
+ (BOOL)isVisionProAsset:(id)a3;
+ (id)_accessibilityDescriptionForFileType:(unint64_t)a3;
+ (id)_apertureStringFromString:(id)a3;
+ (id)_fileTypeImageForType:(unint64_t)a3;
+ (id)_focalLengthFromString:(id)a3;
+ (id)_focalLengthStringFromString:(id)a3;
+ (id)_formattedApertureStringWithString:(id)a3;
+ (id)_formattedDeviceDescriptionForItem:(id)a3;
+ (id)_formattedLensDescriptionForItem:(id)a3;
+ (id)_loadImageWithName:(id)a3;
+ (id)_loadImageWithSystemName:(id)a3;
+ (id)cameraCaptureDeviceDisplayStringForItem:(id)a3;
+ (id)cameraSettingsDisplayStringsForItem:(id)a3;
+ (id)cameraSettingsForItem:(id)a3;
+ (id)fileTypeImageForType:(unint64_t)a3;
+ (id)flashImageForType:(unint64_t)a3;
+ (id)hardwareDisplayStringsForItem:(id)a3;
+ (id)localizedFileFormatForItem:(id)a3;
+ (id)megaPixelsDisplayStringForItem:(id)a3 isAccessibility:(BOOL)a4;
+ (id)meteringModeImageForType:(unint64_t)a3;
+ (id)originalCreationDateForItem:(id)a3;
+ (id)originalLocationForItem:(id)a3;
+ (id)originalTimeZoneForItem:(id)a3;
+ (id)resolutionDisplayStringForItem:(id)a3 isAccessibility:(BOOL)a4;
+ (id)semanticStylesDisplayStringForItem:(id)a3;
+ (id)symbolSystemNamesForItem:(id)a3;
+ (id)whiteBalanceImageForType:(unint64_t)a3;
+ (unint64_t)codecTypeForItem:(id)a3;
+ (unint64_t)fileTypeForItem:(id)a3;
+ (unint64_t)fileTypeForItem:(id)a3 type:(unint64_t)a4;
+ (unint64_t)flashTypeForItem:(id)a3;
+ (unint64_t)meteringModeTypeForItem:(id)a3;
+ (unint64_t)whiteBalanceTypeForItem:(id)a3;
+ (void)processExifMetadataForItem:(id)a3 resultHandler:(id)a4 callbackQueue:(id)a5;
+ (void)requestExifMetadataProcessingIfNeededForItem:(id)a3 onProcessingQueue:(id)a4 withResultHandler:(id)a5;
@end

@implementation PXMetadataUtilities

+ (id)semanticStylesDisplayStringForItem:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v3 fetchPropertySetsIfNeeded], uint64_t v4 = objc_msgSend(v3, "currentSmartStyleCast"), v4))
    {
      v5 = [MEMORY[0x1E4F91100] adjustmentStyleCastDisplayName:v4];
      v6 = [v5 localizedUppercaseString];
    }
    else
    {
      v6 = 0;
    }
    v7 = objc_msgSend(v3, "px_semanticStylePreset");
    v8 = v7;
    if (!v6 && v7)
    {
      if ([v7 integerValue])
      {
        v9 = CEKDisplayStringForSemanticStyleMakerPreset();
        v6 = [v9 localizedUppercaseString];
      }
      else
      {
        v6 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isVisionProAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "px_make");
  v5 = objc_msgSend(v3, "px_model");

  v6 = [v4 lowercaseString];
  int v7 = [v6 isEqualToString:@"apple"];

  char v8 = 0;
  if (v7 && v5)
  {
    v9 = [v5 lowercaseString];
    char v8 = [v9 containsString:@"vision pro"];
  }
  return v8;
}

+ (id)symbolSystemNamesForItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([a1 flashTypeForItem:v4] == 2)
  {
    v6 = [PXMetadataDisplayItem alloc];
    int v7 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionFlash", @"PhotosUICore");
    char v8 = [(PXMetadataDisplayItem *)v6 initWithContent:@"bolt.circle" accessibilityDescription:v7 accessibilityValue:0 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.symbol.flash.fired" accessoryImageSystemName:0];
    [v5 addObject:v8];
  }
  uint64_t v9 = [a1 codecTypeForItem:v4];
  if (v9 == 1)
  {
    v10 = [PXMetadataDisplayItem alloc];
    v11 = PXLocalizedStringFromTable(@"PXInfoPanelEXIFVideoProResBadge", @"PhotosUICore");
    v12 = [(PXMetadataDisplayItem *)v10 initWithContent:@"video.circle.fill" accessibilityDescription:v11 accessibilityValue:0 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.symbol.proRes" accessoryImageSystemName:0];
    [v5 addObject:v12];
  }
  if (objc_msgSend(v4, "px_isCinematicVideo"))
  {
    v13 = [PXMetadataDisplayItem alloc];
    v14 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionCinematicVideo", @"PhotosUICore");
    v15 = @"cinematic.video";
    v16 = @"com.apple.photos.infoPanel.exif.symbol.cinematicVideo";
    goto LABEL_33;
  }
  if (objc_msgSend(v4, "px_isActionModeVideo"))
  {
    v13 = [PXMetadataDisplayItem alloc];
    v14 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionActionModeVideo", @"PhotosUICore");
    v15 = @"figure.run.motion.circle.fill";
    v16 = @"com.apple.photos.infoPanel.exif.symbol.actionMode";
    goto LABEL_33;
  }
  if (v9 == 1) {
    goto LABEL_34;
  }
  if (objc_msgSend(v4, "px_isDepthEffect"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionDepthEffect", @"PhotosUICore");
    v19 = @"f.cursive.circle";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.portrait";
LABEL_30:
    v21 = [(PXMetadataDisplayItem *)v17 initWithContent:v19 accessibilityDescription:v18 accessibilityValue:0 accessibilityIdentifier:v20 accessoryImageSystemName:0];
    [v5 addObject:v21];

    goto LABEL_31;
  }
  if (objc_msgSend(v4, "px_representsBurst"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionBurst", @"PhotosUICore");
    v19 = @"square.stack.3d.down.forward";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.burst";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isPanorama"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionPano", @"PhotosUICore");
    v19 = @"pano";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.pano";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isSelfie"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionSelfie", @"PhotosUICore");
    v19 = @"person.crop.square";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.selfie";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isLivePhoto"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionLivePhoto", @"PhotosUICore");
    v19 = @"livephoto";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.livePhoto";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isScreenshot"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionScreenshot", @"PhotosUICore");
    v19 = @"camera.viewfinder";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.screenshot";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isScreenRecording"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionScreenRecording", @"PhotosUICore");
    v19 = @"record.circle";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.screenRecording";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isSloMo"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionSloMo", @"PhotosUICore");
    v19 = @"slowmo";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.slomo";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isTimelapse"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionTimelapse", @"PhotosUICore");
    v19 = @"timelapse";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.timelapse";
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "px_isVideo"))
  {
    v17 = [PXMetadataDisplayItem alloc];
    v18 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionVideo", @"PhotosUICore");
    v19 = @"video";
    v20 = @"com.apple.photos.infoPanel.exif.symbol.video";
    goto LABEL_30;
  }
LABEL_31:
  if (!objc_msgSend(v4, "px_isSpatialMedia")) {
    goto LABEL_34;
  }
  v13 = [PXMetadataDisplayItem alloc];
  v14 = PXLocalizedStringFromTable(@"PXInfoPanelSymbolAXDescriptionSpatialCapture", @"PhotosUICore");
  v15 = @"spatial";
  v16 = @"com.apple.photos.infoPanel.exif.symbol.spatial";
LABEL_33:
  v22 = [(PXMetadataDisplayItem *)v13 initWithContent:v15 accessibilityDescription:v14 accessibilityValue:0 accessibilityIdentifier:v16 accessoryImageSystemName:0];
  [v5 addObject:v22];

LABEL_34:
  return v5;
}

+ (id)cameraSettingsDisplayStringsForItem:(id)a3
{
  v53[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 cameraSettingsForItem:v4];
  if (v5)
  {
    if (objc_msgSend(v4, "px_isVideo"))
    {
      v6 = [v5 objectForKeyedSubscript:@"fps"];
      int v7 = [v5 objectForKeyedSubscript:@"duration"];
      v48 = +[PXMetadataDisplayItem emptyItem];
      v53[0] = v48;
      char v8 = [PXMetadataDisplayItem alloc];
      v49 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsMediaFPSAXDescription", @"PhotosUICore");
      v50 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v8, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v6);
      v53[1] = v50;
      v47 = +[PXMetadataDisplayItem emptyItem];
      v53[2] = v47;
      uint64_t v9 = [PXMetadataDisplayItem alloc];
      v10 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsMediaDurationAXDescription", @"PhotosUICore");
      v11 = [(PXMetadataDisplayItem *)v9 initWithContent:v7 accessibilityDescription:v10 accessibilityValue:v7 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.video.duration" accessoryImageSystemName:0];
      v53[3] = v11;
      v12 = +[PXMetadataDisplayItem emptyItem];
      v53[4] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:5];
    }
    else if (objc_msgSend(v4, "px_isAudio"))
    {
      v6 = [v5 objectForKeyedSubscript:@"sampleRate"];
      int v7 = [v5 objectForKeyedSubscript:@"bitrate"];
      uint64_t v14 = [v5 objectForKeyedSubscript:@"duration"];
      v15 = [PXMetadataDisplayItem alloc];
      v49 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsMediaBitrateAXDescription", @"PhotosUICore");
      v50 = [(PXMetadataDisplayItem *)v15 initWithContent:v6 accessibilityDescription:v49 accessibilityValue:v6 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.audio.samplerate" accessoryImageSystemName:0];
      v52[0] = v50;
      v47 = +[PXMetadataDisplayItem emptyItem];
      v52[1] = v47;
      v16 = [PXMetadataDisplayItem alloc];
      uint64_t v45 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsMediaBitrateAXDescription", @"PhotosUICore");
      v11 = [(PXMetadataDisplayItem *)v16 initWithContent:v7 accessibilityDescription:v45 accessibilityValue:v7 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.audio.bitrate" accessoryImageSystemName:0];
      v52[2] = v11;
      v12 = +[PXMetadataDisplayItem emptyItem];
      v52[3] = v12;
      v17 = [PXMetadataDisplayItem alloc];
      v18 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsMediaDurationAXDescription", @"PhotosUICore");
      v48 = (void *)v14;
      v19 = [(PXMetadataDisplayItem *)v17 initWithContent:v14 accessibilityDescription:v18 accessibilityValue:v14 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.audio.duration" accessoryImageSystemName:0];
      v52[4] = v19;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];

      v10 = (void *)v45;
    }
    else
    {
      uint64_t v44 = [v5 objectForKeyedSubscript:@"iso"];
      uint64_t v20 = [v5 objectForKeyedSubscript:@"iso.ax"];
      v40 = (void *)v20;
      uint64_t v21 = [v5 objectForKeyedSubscript:@"focalLength"];
      v49 = [v5 objectForKeyedSubscript:@"exposure"];
      v50 = [v5 objectForKeyedSubscript:@"exposure.ax"];
      v47 = [v5 objectForKeyedSubscript:@"aperture"];
      uint64_t v46 = [v47 stringByReplacingOccurrencesOfString:@"/" withString:&stru_1F00B0030];
      v11 = [v5 objectForKeyedSubscript:@"aperture.ax"];
      v12 = [(PXMetadataDisplayItem *)v11 stringByReplacingOccurrencesOfString:@"/" withString:&stru_1F00B0030];
      v43 = [v5 objectForKeyedSubscript:@"shutterSpeed"];
      v39 = [v5 objectForKeyedSubscript:@"shutterSpeed.ax"];
      int v22 = objc_msgSend(v4, "px_shotWithNightMode");
      v23 = @"camera.nightmode";
      if (!v22) {
        v23 = 0;
      }
      v37 = v23;
      v24 = [PXMetadataDisplayItem alloc];
      v42 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsISOAXDescription", @"PhotosUICore");
      v41 = [(PXMetadataDisplayItem *)v24 initWithContent:v44 accessibilityDescription:v42 accessibilityValue:v20 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.image.iso" accessoryImageSystemName:0];
      v51[0] = v41;
      v25 = [PXMetadataDisplayItem alloc];
      v38 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsFocalLengthAXDescription", @"PhotosUICore");
      v48 = (void *)v21;
      v36 = [(PXMetadataDisplayItem *)v25 initWithContent:v21 accessibilityDescription:v38 accessibilityValue:v21 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.image.focalLength" accessoryImageSystemName:0];
      v51[1] = v36;
      v26 = [PXMetadataDisplayItem alloc];
      v35 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsExposureBiasAXDescription", @"PhotosUICore");
      v34 = [(PXMetadataDisplayItem *)v26 initWithContent:v49 accessibilityDescription:v35 accessibilityValue:v50 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.image.exposureBias" accessoryImageSystemName:0];
      v51[2] = v34;
      v27 = [PXMetadataDisplayItem alloc];
      v33 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsApertureAXDescription", @"PhotosUICore");
      v28 = [(PXMetadataDisplayItem *)v27 initWithContent:v46 accessibilityDescription:v33 accessibilityValue:v12 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.image.aperture" accessoryImageSystemName:0];
      v51[3] = v28;
      v29 = [PXMetadataDisplayItem alloc];
      v30 = PXLocalizedStringFromTable(@"PXMetadataUtilitiesCameraSettingsShutterSpeedAXDescription", @"PhotosUICore");
      v31 = [(PXMetadataDisplayItem *)v29 initWithContent:v43 accessibilityDescription:v30 accessibilityValue:v39 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.image.shutterSpeed" accessoryImageSystemName:v37];

      v51[4] = v31;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:5];

      v6 = (void *)v44;
      v10 = (void *)v46;

      int v7 = v40;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

+ (id)_formattedApertureStringWithString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"f/", @"ƒ", 1, 0, objc_msgSend(v3, "length"));

  return v4;
}

+ (id)_apertureStringFromString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@" "];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_619];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 objectAtIndexedSubscript:v4];
  }

  return v5;
}

uint64_t __49__PXMetadataUtilities__apertureStringFromString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"f/"];
}

+ (id)_focalLengthStringFromString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@" "];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_617];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 objectAtIndexedSubscript:v4];
  }

  return v5;
}

uint64_t __52__PXMetadataUtilities__focalLengthStringFromString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"mm"];
}

+ (id)_focalLengthFromString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@" "];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_615];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    v6 = [v3 objectAtIndexedSubscript:v4];
    int v7 = NSNumber;
    [v6 doubleValue];
    id v5 = objc_msgSend(v7, "numberWithDouble:");
  }
  return v5;
}

uint64_t __46__PXMetadataUtilities__focalLengthFromString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"mm"];
}

+ (id)_formattedLensDescriptionForItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "px_make");
  v6 = objc_msgSend(v4, "px_model");
  int v7 = objc_msgSend(v4, "px_lensModel");
  char v8 = [v5 lowercaseString];
  char v9 = [v8 isEqualToString:@"apple"];

  if ((v9 & 1) == 0)
  {
    if (v7) {
      [a1 _formattedApertureStringWithString:v7];
    }
    else {
    v27 = PXLocalizedStringFromTable(@"PXInfoPanelLCDUnknownLens", @"PhotosUICore");
    }
    goto LABEL_37;
  }
  id v10 = v7;
  v11 = v10;
  if (!v6 || !v10) {
    goto LABEL_35;
  }
  uint64_t v12 = objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1F00B0030, 1, 0, objc_msgSend(v10, "length"));

  uint64_t v13 = [a1 _apertureStringFromString:v12];
  uint64_t v14 = [a1 _focalLengthFromString:v12];
  if (!_focalLengthFormatter)
  {
    v15 = objc_alloc_init(PXFocalDistanceFormatter);
    v16 = (void *)_focalLengthFormatter;
    _focalLengthFormatter = (uint64_t)v15;
  }
  v17 = +[PXMetadataUtilitiesCameraDevice cameraForFocalLength:v14 deviceName:v6];
  v62 = (void *)v14;
  id v63 = a1;
  if (!v17)
  {
    v61 = objc_msgSend(v4, "px_digitalZoomRatio");
    v25 = objc_msgSend(v4, "px_focalLengthIn35mm");
    uint64_t v28 = +[PXMetadataUtilities cameraCaptureDeviceDisplayStringForItem:v4];
    v60 = (void *)v13;
    if (!v14 || !v25)
    {
      v26 = (void *)v12;
      v23 = v61;
      if (!v28)
      {
LABEL_30:
        uint64_t v44 = [v26 capitalizedString];

        uint64_t v45 = PXLocalizedStringFromTable(@"PXInfoPanelLCDFaceTimeCamera", @"PhotosUICore");
        uint64_t v46 = [v44 stringByReplacingOccurrencesOfString:@"Facetime" withString:v45];

        v47 = PXLocalizedStringFromTable(@"PXInfoPanelLCDFrontiSightCamera", @"PhotosUICore");
        v48 = [v46 stringByReplacingOccurrencesOfString:@"Isight" withString:v47];

        v49 = PXLocalizedStringFromTable(@"PXInfoPanelLCDFrontTrueDepthCamera", @"PhotosUICore");
        v50 = [v48 stringByReplacingOccurrencesOfString:@"Truedepth" withString:v49];

        v51 = [v50 stringByReplacingOccurrencesOfString:@"Mm" withString:@"mm"];

        v26 = [v51 stringByReplacingOccurrencesOfString:@"Camera " withString:@"Camera — "];

        v23 = v61;
        uint64_t v20 = 0;
        goto LABEL_31;
      }
LABEL_18:
      uint64_t v20 = (void *)v28;
LABEL_31:
      uint64_t v21 = 0;
      v18 = v60;
      goto LABEL_32;
    }
    uint64_t v58 = v28;
    v29 = (void *)v12;
    if (v61 && ([v61 doubleValue], v30 > 0.0))
    {
      v31 = NSNumber;
      [v25 doubleValue];
      double v33 = v32;
      [v61 doubleValue];
      id v35 = [v31 numberWithDouble:v33 / v34];
    }
    else
    {
      id v35 = v25;
    }
    v36 = v35;
    v59 = [v63 _focalLengthStringFromString:v29];
    v37 = (void *)_focalLengthFormatter;
    v38 = NSNumber;
    v57 = v36;
    [v36 floatValue];
    v40 = [v38 numberWithLong:llroundf(v39)];
    v41 = [v37 stringForObjectValue:v40];

    if (v58 && v59 && v41)
    {
      uint64_t v56 = [NSString stringWithFormat:@"%@ — %@ %@", v58, v41, v60];
      v23 = v61;
      v42 = v29;
    }
    else
    {
      if (!v59 || !v41)
      {
        v23 = v61;
        v43 = v29;
LABEL_29:

        v26 = v43;
        uint64_t v28 = v58;
        if (!v58) {
          goto LABEL_30;
        }
        goto LABEL_18;
      }
      v42 = v29;
      uint64_t v56 = [v29 stringByReplacingOccurrencesOfString:v59 withString:v41];
      v23 = v61;
    }

    v43 = (void *)v56;
    goto LABEL_29;
  }
  v18 = (void *)v13;
  v19 = (void *)_focalLengthFormatter;
  uint64_t v20 = (void *)v12;
  uint64_t v21 = v17;
  int v22 = [v17 focalLengthIn35mm];
  v23 = [v19 stringForObjectValue:v22];

  v24 = NSString;
  v25 = [v21 displayName];
  v26 = [v24 stringWithFormat:@"%@ — %@ %@", v25, v23, v18];
LABEL_32:

  v52 = [v63 _formattedApertureStringWithString:v26];

  v53 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v11 = [v52 stringByTrimmingCharactersInSet:v53];

  if (!v11 || ![v11 length])
  {
LABEL_35:
    PXLocalizedStringFromTable(@"PXInfoPanelLCDUnknownLens", @"PhotosUICore");
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  id v54 = v11;
  v11 = v54;
LABEL_36:
  v27 = v54;

LABEL_37:
  return v27;
}

+ (id)_formattedDeviceDescriptionForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "px_formattedCameraModel");
  if (!v4)
  {
    if (objc_msgSend(v3, "px_isScreenshot"))
    {
      id v5 = @"PXInfoPanelLCDScreenshot";
    }
    else if (objc_msgSend(v3, "px_isScreenRecording"))
    {
      id v5 = @"PXInfoPanelLCDScreenRecording";
    }
    else
    {
      id v5 = @"PXInfoPanelLCDUnknownCamera";
    }
    id v4 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  }

  return v4;
}

+ (id)hardwareDisplayStringsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 fetchPropertySetsIfNeeded];
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [a1 _formattedDeviceDescriptionForItem:v4];
  [v5 setObject:v6 forKeyedSubscript:PXMetadataUtilitiesHardwareKeyDevice];

  int v7 = [a1 _formattedLensDescriptionForItem:v4];
  [v5 setObject:v7 forKeyedSubscript:PXMetadataUtilitiesHardwareKeyFormattedLens];

  char v8 = objc_msgSend(v4, "px_lensModel");
  [v5 setObject:v8 forKeyedSubscript:PXMetadataUtilitiesHardwareKeyUnformattedLens];

  return v5;
}

+ (id)resolutionDisplayStringForItem:(id)a3 isAccessibility:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = objc_msgSend(a3, "px_resolution");
  uint64_t v7 = v6;
  char v8 = [NSNumber numberWithLong:v5];
  char v9 = [NSNumber numberWithLong:v7];
  id v10 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v8 numberStyle:0];
  v11 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v9 numberStyle:0];
  if (v4) {
    uint64_t v12 = @"PXInfoPanelAXLCDResolutionFormat";
  }
  else {
    uint64_t v12 = @"PXInfoPanelLCDResolutionFormat";
  }
  uint64_t v13 = PXLocalizedStringFromTable(v12, @"PhotosUICore");
  uint64_t v14 = PXStringWithValidatedFormat();

  return v14;
}

+ (id)cameraCaptureDeviceDisplayStringForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 fetchPropertySetsIfNeeded];
    uint64_t v5 = [v4 originalImageProperties];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F15540]];
    char v8 = v7;
    if (v7 && (unint64_t v9 = [v7 integerValue] - 2, v9 <= 4))
    {
      id v10 = PXLocalizedStringFromTable(off_1E5DAE508[v9], @"PhotosUICore");
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)megaPixelsDisplayStringForItem:(id)a3 isAccessibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int64_t v6 = objc_msgSend(v5, "px_resolution");
  int64_t v8 = v7;
  if (objc_msgSend(v5, "px_isImage"))
  {
    double v9 = (double)(unint64_t)v6 * (double)(unint64_t)v8 / 1000000.0;
    if (v9 >= 1.0)
    {
      BOOL v14 = fmod((double)(unint64_t)v6 * (double)(unint64_t)v8 / 1000000.0, 1.0) < 0.9;
      double v10 = floor(v9);
      double v15 = ceil(v9);
      if (!v14) {
        double v10 = v15;
      }
    }
    else
    {
      double v10 = round(v9 * 10.0) / 10.0;
    }
    v16 = [NSNumber numberWithDouble:v10];
    id v17 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v18 = v17;
    if (v4) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = 1;
    }
    if (v4) {
      uint64_t v20 = @"PXInfoPanelMegaPixelsAXFormat";
    }
    else {
      uint64_t v20 = @"PXInfoPanelMegaPixelsFormat";
    }
    [v17 setNumberStyle:v19];
    uint64_t v21 = [v18 stringFromNumber:v16];
    int v22 = PXLocalizedStringFromTable(v20, @"PhotosUICore");
    v11 = PXStringWithValidatedFormat();
  }
  else
  {
    v11 = 0;
    if (!objc_msgSend(v5, "px_isVideo")) {
      goto LABEL_48;
    }
    if (v6 >= v8) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = v6;
    }
    if (v12 <= 1439)
    {
      switch(v12)
      {
        case 480:
          if (v4) {
            uint64_t v13 = @"PXInfoPanelVideoResolutionAX480p";
          }
          else {
            uint64_t v13 = @"PXInfoPanelVideoResolution480p";
          }
          break;
        case 720:
          if (v4) {
            uint64_t v13 = @"PXInfoPanelVideoResolutionAX720p";
          }
          else {
            uint64_t v13 = @"PXInfoPanelVideoResolution720p";
          }
          break;
        case 1080:
          if (v4) {
            uint64_t v13 = @"PXInfoPanelVideoResolutionAX1080p";
          }
          else {
            uint64_t v13 = @"PXInfoPanelVideoResolution1080p";
          }
          break;
        default:
          goto LABEL_48;
      }
    }
    else if (v12 > 2159)
    {
      if (v12 == 2160)
      {
        if (v4) {
          uint64_t v13 = @"PXInfoPanelVideoResolutionAX4k";
        }
        else {
          uint64_t v13 = @"PXInfoPanelVideoResolution4k";
        }
      }
      else
      {
        if (v12 != 4320) {
          goto LABEL_48;
        }
        if (v4) {
          uint64_t v13 = @"PXInfoPanelVideoResolutionAX8k";
        }
        else {
          uint64_t v13 = @"PXInfoPanelVideoResolution8k";
        }
      }
    }
    else if (v12 == 1440)
    {
      if (v4) {
        uint64_t v13 = @"PXInfoPanelVideoResolutionAX1440p";
      }
      else {
        uint64_t v13 = @"PXInfoPanelVideoResolution1440p";
      }
    }
    else
    {
      if (v12 != 1584) {
        goto LABEL_48;
      }
      if (v4) {
        uint64_t v13 = @"PXInfoPanelVideoResolutionAX28k";
      }
      else {
        uint64_t v13 = @"PXInfoPanelVideoResolution28k";
      }
    }
    v11 = PXLocalizedStringFromTable(v13, @"PhotosUICore");
  }
LABEL_48:

  return v11;
}

+ (id)fileTypeImageForType:(unint64_t)a3
{
  id v5 = objc_msgSend(a1, "_fileTypeImageForType:");
  int64_t v6 = [a1 _accessibilityDescriptionForFileType:a3];
  int64_t v7 = [[PXMetadataDisplayItem alloc] initWithContent:v5 accessibilityDescription:v6 accessibilityValue:0 accessibilityIdentifier:@"com.apple.photos.infoPanel.exif.fileType" accessoryImageSystemName:0];

  return v7;
}

+ (unint64_t)codecTypeForItem:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "px_isProRes"))
  {
    unint64_t v4 = 1;
  }
  else if (objc_msgSend(v3, "px_isH264"))
  {
    unint64_t v4 = 2;
  }
  else if (objc_msgSend(v3, "px_isHEVC"))
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_fileTypeImageForType:(unint64_t)a3
{
  if (a3 > 0x11) {
    id v3 = @"LCD-Filetype-JPEG";
  }
  else {
    id v3 = off_1E5DAE478[a3];
  }
  return (id)[a1 _loadImageWithName:v3];
}

+ (id)_accessibilityDescriptionForFileType:(unint64_t)a3
{
  if (a3 > 0x10) {
    id v3 = @"PXFileTypeAXDescriptionUnknown";
  }
  else {
    id v3 = off_1E5DAE3F0[a3];
  }
  unint64_t v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");
  return v4;
}

+ (id)meteringModeImageForType:(unint64_t)a3
{
  unint64_t v4 = @"camera.metering.unknown";
  switch(a3)
  {
    case 0uLL:
      return (id)[MEMORY[0x1E4FB1818] systemImageNamed:v4];
    case 1uLL:
      unint64_t v4 = @"camera.metering.center.weighted.average";
      break;
    case 2uLL:
      unint64_t v4 = @"camera.metering.center.weighted";
      break;
    case 3uLL:
      unint64_t v4 = @"camera.metering.spot";
      break;
    case 4uLL:
      unint64_t v4 = @"camera.metering.multispot";
      break;
    case 5uLL:
      unint64_t v4 = @"camera.metering.matrix";
      break;
    case 6uLL:
      unint64_t v4 = @"camera.metering.partial";
      break;
    default:
      if (a3 != 255) {
        unint64_t v4 = @"camera.metering.none";
      }
      break;
  }
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:v4];
}

+ (id)whiteBalanceImageForType:(unint64_t)a3
{
  if (a3 - 2 > 7) {
    id v3 = @"LCD-WB";
  }
  else {
    id v3 = off_1E5DAE3B0[a3 - 2];
  }
  return (id)[a1 _loadImageWithName:v3];
}

+ (id)flashImageForType:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = objc_msgSend(a1, "_loadImageWithName:", @"LCD-Flash-Fired", v3);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)_loadImageWithSystemName:(id)a3
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:a3];
}

+ (id)_loadImageWithName:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleWithIdentifier:@"com.apple.PhotosUICore"];
  int64_t v6 = [MEMORY[0x1E4FB1818] imageNamed:v4 inBundle:v5 withConfiguration:0];

  return v6;
}

+ (id)cameraSettingsForItem:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = PXLocalizedStringFromTable(@"PXInfoPanelMissingValuePlaceholder", @"PhotosUICore");
  if (cameraSettingsForItem__onceToken != -1) {
    dispatch_once(&cameraSettingsForItem__onceToken, &__block_literal_global_1832);
  }
  uint64_t v43 = objc_msgSend(v3, "px_ISORating");
  v42 = [NSString stringWithFormat:@"%@", v43];
  int64_t v6 = objc_msgSend(v3, "px_focalLengthIn35mm");
  int64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "px_focalLength");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v45 = v8;

  double v9 = objc_msgSend(v3, "px_aperture");
  double v10 = NSString;
  v11 = [(id)_apertureFormatter stringForObjectValue:v9];
  v41 = [v10 stringWithFormat:@"f %@", v11];

  uint64_t v12 = objc_msgSend(v3, "px_shutterSpeed");
  uint64_t v13 = objc_msgSend(v3, "px_exposureBias");
  v40 = [NSString stringWithFormat:@"%@ e v", v13];
  uint64_t v44 = objc_msgSend(v3, "px_FPS");
  float v39 = objc_msgSend(v3, "px_duration");
  BOOL v14 = objc_msgSend(v3, "px_bitRate");
  double v15 = NSNumber;
  v16 = objc_msgSend(v3, "px_sampleRate");
  [v16 doubleValue];
  id v17 = objc_msgSend(v15, "numberWithDouble:");

  v18 = (void *)v43;
  if (v43)
  {
    uint64_t v19 = [(id)_isoFormatter stringForObjectValue:v43];
    [v4 setObject:v19 forKeyedSubscript:@"iso"];

    uint64_t v20 = v42;
  }
  else
  {
    [v4 setObject:v5 forKeyedSubscript:@"iso"];
    uint64_t v20 = v5;
  }
  [v4 setObject:v20 forKeyedSubscript:@"iso.ax"];
  if (v45)
  {
    uint64_t v21 = objc_msgSend((id)_focalLengthFormatter, "stringForObjectValue:");
    [v4 setObject:v21 forKeyedSubscript:@"focalLength"];

    if (v13)
    {
LABEL_11:
      int v22 = [(id)_exposureFormatter stringForObjectValue:v13];
      [v4 setObject:v22 forKeyedSubscript:@"exposure"];

      v23 = v40;
      goto LABEL_14;
    }
  }
  else
  {
    [v4 setObject:v5 forKeyedSubscript:@"focalLength"];
    if (v13) {
      goto LABEL_11;
    }
  }
  [v4 setObject:v5 forKeyedSubscript:@"exposure"];
  v23 = v5;
LABEL_14:
  [v4 setObject:v23 forKeyedSubscript:@"exposure.ax"];
  if (v9)
  {
    v24 = [(id)_apertureFormatter stringForObjectValue:v9];
    [v4 setObject:v24 forKeyedSubscript:@"aperture"];

    v25 = v41;
  }
  else
  {
    [v4 setObject:v5 forKeyedSubscript:@"aperture"];
    v25 = v5;
  }
  [v4 setObject:v25 forKeyedSubscript:@"aperture.ax"];
  if (v12)
  {
    v26 = [(id)_shutterSpeedFormatter stringForObjectValue:v12];
    [v4 setObject:v26 forKeyedSubscript:@"shutterSpeed"];

    v27 = [(id)_shutterSpeedAXFormatter stringForObjectValue:v12];
    [v4 setObject:v27 forKeyedSubscript:@"shutterSpeed.ax"];

    if (v14) {
      goto LABEL_19;
    }
LABEL_22:
    [v4 setObject:v5 forKeyedSubscript:@"bitrate"];
    if (v17) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  [v4 setObject:v5 forKeyedSubscript:@"shutterSpeed"];
  [v4 setObject:v5 forKeyedSubscript:@"shutterSpeed.ax"];
  if (!v14) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v28 = [(id)_mediaBitrateFormatter stringFromNumber:v14];
  [v4 setObject:v28 forKeyedSubscript:@"bitrate"];

  if (v17)
  {
LABEL_20:
    v29 = [(id)_mediaSampleRateFormatter stringFromNumber:v17];
    [v4 setObject:v29 forKeyedSubscript:@"sampleRate"];

    goto LABEL_24;
  }
LABEL_23:
  [v4 setObject:v5 forKeyedSubscript:@"sampleRate"];
LABEL_24:
  if (v44)
  {
    double v30 = objc_msgSend((id)_mediaFPSFormatter, "stringFromNumber:");
    [v4 setObject:v30 forKeyedSubscript:@"fps"];
  }
  else
  {
    [v4 setObject:v5 forKeyedSubscript:@"fps"];
  }
  v31 = v39;
  if (v39)
  {
    [v39 doubleValue];
    double v33 = round(v32);
    if (v33 <= 3600.0) {
      double v34 = @"mm:ss";
    }
    else {
      double v34 = @"HH:mm:ss";
    }
    [(id)_mediaDurationFormatter setDateFormat:v34];
    id v35 = (void *)_mediaDurationFormatter;
    v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v33];
    v37 = [v35 stringFromDate:v36];
    [v4 setObject:v37 forKeyedSubscript:@"duration"];

    v31 = v39;
    v18 = (void *)v43;
  }
  else
  {
    [v4 setObject:v5 forKeyedSubscript:@"duration"];
  }

  return v4;
}

void __45__PXMetadataUtilities_cameraSettingsForItem___block_invoke()
{
  if (!_focalLengthFormatter)
  {
    v0 = objc_alloc_init(PXFocalDistanceFormatter);
    v1 = (void *)_focalLengthFormatter;
    _focalLengthFormatter = (uint64_t)v0;
  }
  if (!_isoFormatter)
  {
    v2 = objc_alloc_init(PXISOFormatter);
    id v3 = (void *)_isoFormatter;
    _isoFormatter = (uint64_t)v2;
  }
  if (!_exposureFormatter)
  {
    id v4 = objc_alloc_init(PXExposureBiasFormatter);
    id v5 = (void *)_exposureFormatter;
    _exposureFormatter = (uint64_t)v4;
  }
  if (!_shutterSpeedFormatter)
  {
    int64_t v6 = objc_alloc_init(PXShutterSpeedFormatter);
    int64_t v7 = (void *)_shutterSpeedFormatter;
    _shutterSpeedFormatter = (uint64_t)v6;
  }
  if (!_shutterSpeedAXFormatter)
  {
    id v8 = objc_alloc_init(PXShutterSpeedFormatter);
    double v9 = (void *)_shutterSpeedAXFormatter;
    _shutterSpeedAXFormatter = (uint64_t)v8;

    [(id)_shutterSpeedAXFormatter setNumberStyle:5];
  }
  if (!_apertureFormatter)
  {
    double v10 = objc_alloc_init(PXApertureFormatter);
    v11 = (void *)_apertureFormatter;
    _apertureFormatter = (uint64_t)v10;
  }
  if (!_dateFormatter)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v13 = (void *)_dateFormatter;
    _dateFormatter = (uint64_t)v12;

    BOOL v14 = (void *)_dateFormatter;
    double v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [v14 setTimeZone:v15];
  }
  if (!_intervalFormatter)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    id v17 = (void *)_intervalFormatter;
    _intervalFormatter = (uint64_t)v16;
  }
  if (!_mediaDurationFormatter)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v19 = (void *)_mediaDurationFormatter;
    _mediaDurationFormatter = (uint64_t)v18;

    uint64_t v20 = (void *)_mediaDurationFormatter;
    uint64_t v21 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v20 setTimeZone:v21];
  }
  if (!_mediaFPSFormatter)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v23 = (void *)_mediaFPSFormatter;
    _mediaFPSFormatter = (uint64_t)v22;

    v24 = PXLocalizedStringFromTable(@"PXInfoPanelLCDMediaFPSNumberFormat", @"PhotosUICore");
    [(id)_mediaFPSFormatter setPositiveFormat:v24];
  }
  if (!_mediaBitrateFormatter)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v26 = (void *)_mediaBitrateFormatter;
    _mediaBitrateFormatter = (uint64_t)v25;

    v27 = PXLocalizedStringFromTable(@"PXInfoPanelLCDMediaBitrateNumberFormat", @"PhotosUICore");
    [(id)_mediaBitrateFormatter setPositiveFormat:v27];

    [(id)_mediaBitrateFormatter setMultiplier:&unk_1F02DA150];
  }
  if (!_mediaSampleRateFormatter)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v29 = (void *)_mediaSampleRateFormatter;
    _mediaSampleRateFormatter = (uint64_t)v28;

    double v30 = PXLocalizedStringFromTable(@"PXInfoPanelLCDMediaSampleRateNumberFormat", @"PhotosUICore");
    [(id)_mediaSampleRateFormatter setPositiveFormat:v30];

    v31 = (void *)_mediaSampleRateFormatter;
    [v31 setMultiplier:&unk_1F02DA150];
  }
}

+ (id)localizedFileFormatForItem:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[PXMetadataUtilities codecTypeForItem:v3] - 1;
  if (v4 >= 3)
  {
    unint64_t v6 = +[PXMetadataUtilities fileTypeForItem:v3];
    if (v6 >= 0x12 || ((0x3C9FFu >> v6) & 1) == 0)
    {
      int64_t v7 = 0;
      goto LABEL_8;
    }
    id v5 = &off_1E5DAE320[v6];
  }
  else
  {
    id v5 = &off_1E5DAE308[v4];
  }
  int64_t v7 = PXLocalizedStringFromTable(*v5, @"PhotosUICore");
LABEL_8:

  return v7;
}

+ (unint64_t)fileTypeForItem:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  if (objc_msgSend(v5, "px_representsBurst"))
  {
    a4 = 11;
  }
  else
  {
    switch(a4)
    {
      case 0uLL:
        if (objc_msgSend(v5, "px_isLivePhoto")) {
          a4 = 15;
        }
        else {
          a4 = 1;
        }
        break;
      case 1uLL:
        if (objc_msgSend(v5, "px_isLivePhoto")) {
          a4 = 16;
        }
        else {
          a4 = 2;
        }
        break;
      case 2uLL:
        a4 = 0;
        break;
      case 3uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
        break;
      case 4uLL:
        a4 = 5;
        break;
      case 5uLL:
        a4 = 4;
        break;
      case 0xAuLL:
        if (objc_msgSend(v5, "px_isTimelapse")) {
          a4 = 13;
        }
        else {
          a4 = 10;
        }
        if (objc_msgSend(v5, "px_isSloMo")) {
          a4 = 12;
        }
        break;
      case 0xBuLL:
        a4 = 17;
        break;
      default:
        a4 = 18;
        break;
    }
  }

  return a4;
}

+ (unint64_t)fileTypeForItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a1, "fileTypeForItem:type:", v4, objc_msgSend(v4, "px_originalType"));

  return v5;
}

+ (unint64_t)meteringModeTypeForItem:(id)a3
{
  id v3 = objc_msgSend(a3, "px_meteringMode");
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

+ (unint64_t)whiteBalanceTypeForItem:(id)a3
{
  id v3 = objc_msgSend(a3, "px_whiteBalance");
  uint64_t v4 = [v3 integerValue];
  unint64_t v5 = 1;
  switch(v4)
  {
    case 0:
      break;
    case 1:
    case 9:
      unint64_t v5 = 2;
      break;
    case 2:
    case 12:
    case 13:
    case 14:
    case 15:
      unint64_t v5 = 3;
      break;
    case 3:
    case 24:
      unint64_t v5 = 4;
      break;
    case 4:
      unint64_t v5 = 5;
      break;
    case 5:
    case 6:
    case 7:
    case 8:
    case 16:
      goto LABEL_11;
    case 10:
      unint64_t v5 = 6;
      break;
    case 11:
      unint64_t v5 = 7;
      break;
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
      unint64_t v5 = 8;
      break;
    default:
      if ((unint64_t)(v4 - 1006) > 0xF || ((1 << (v4 + 18)) & 0xFE7B) == 0) {
LABEL_11:
      }
        unint64_t v5 = 0;
      else {
        unint64_t v5 = 9;
      }
      break;
  }

  return v5;
}

+ (unint64_t)flashTypeForItem:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "px_supportsImageProperties"))
  {
    uint64_t v4 = objc_msgSend(v3, "px_flash");
    if ([v4 integerValue] == 1) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (void)processExifMetadataForItem:(id)a3 resultHandler:(id)a4 callbackQueue:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    PXAssertGetLog();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = os_log_create((const char *)*MEMORY[0x1E4F8A240], "InfoPanelEXIFMetadataSignPost");
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, a1);
    BOOL v14 = v12;
    double v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v16 = [v11 uuid];
      *(_DWORD *)buf = 138412290;
      id v28 = v16;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "InfoPanelEXIFMetadataProcessing", "beginning exif processing for asset: %@", buf, 0xCu);
    }
    id v17 = [v11 photoLibrary];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke;
    v25[3] = &unk_1E5DD36F8;
    id v26 = v11;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_2;
    v19[3] = &unk_1E5DCB1D8;
    os_signpost_id_t v24 = v13;
    uint64_t v20 = v15;
    id v21 = v26;
    id v22 = v10;
    id v23 = v9;
    id v18 = v15;
    [v17 performChanges:v25 completionHandler:v19];
  }
}

void __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  [v1 updateExtendedAttributesUsingOriginalMediaMetadata];
}

void __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = *(id *)(a1 + 32);
  int64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "InfoPanelEXIFMetadataProcessing", "", buf, 2u);
  }

  if ((v5 || (a2 & 1) == 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = [*(id *)(a1 + 40) uuid];
    id v11 = [v5 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to process EXIF metadata for asset: %@ with error: %@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_243;
  v12[3] = &unk_1E5DCE8A0;
  id v9 = *(NSObject **)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  char v14 = a2;
  dispatch_async(v9, v12);
}

uint64_t __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_243(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (void)requestExifMetadataProcessingIfNeededForItem:(id)a3 onProcessingQueue:(id)a4 withResultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__PXMetadataUtilities_requestExifMetadataProcessingIfNeededForItem_onProcessingQueue_withResultHandler___block_invoke;
  v11[3] = &unk_1E5DD3280;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)a4, v11);
}

uint64_t __104__PXMetadataUtilities_requestExifMetadataProcessingIfNeededForItem_onProcessingQueue_withResultHandler___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "px_isExtendedPropertiesProcessed"))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = MEMORY[0x1E4F14428];
    return +[PXMetadataUtilities processExifMetadataForItem:v4 resultHandler:v5 callbackQueue:v6];
  }
}

+ (id)originalLocationForItem:(id)a3
{
  return (id)objc_msgSend(a3, "px_originalLocation");
}

+ (id)originalTimeZoneForItem:(id)a3
{
  return (id)objc_msgSend(a3, "px_originalTimeZone");
}

+ (id)originalCreationDateForItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "px_originalCreationDate");
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = objc_msgSend(v3, "px_creationDate");
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C9C8] now];
    }
    id v6 = v9;
  }
  return v6;
}

@end