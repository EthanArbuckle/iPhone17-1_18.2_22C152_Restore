@interface MRGroupSymbolProvider
+ (id)symbolNameForComposition:(id)a3;
@end

@implementation MRGroupSymbolProvider

+ (id)symbolNameForComposition:(id)a3
{
  id v3 = a3;
  if ([v3 totalCount] == 1)
  {
    v4 = [v3 soloModelIdentifier];

    if (v4)
    {
      v5 = +[MRDeviceIdentifierSymbolProvider sharedProvider];
      v6 = [v3 soloModelIdentifier];
      v7 = [v5 symbolNameForModelID:v6];

      if (v7) {
        goto LABEL_69;
      }
    }
  }
  if ([v3 totalCount] == 1)
  {
    v8 = [v3 soloProductIdentifier];

    if (v8)
    {
      v9 = +[MRDeviceIdentifierSymbolProvider sharedProvider];
      v10 = [v3 soloProductIdentifier];
      v7 = [v9 symbolNameForProductIdentifier:v10];

      if (v7) {
        goto LABEL_69;
      }
    }
  }
  if ([v3 atvCount] && objc_msgSend(v3, "homePodCount"))
  {
    v7 = @"homepod.and.appletv.fill";
    goto LABEL_69;
  }
  if ([v3 atvCount] && objc_msgSend(v3, "homePodMiniCount"))
  {
    v7 = @"homepodmini.and.appletv.fill";
    goto LABEL_69;
  }
  if ([v3 atvCount] && objc_msgSend(v3, "hifiCount"))
  {
    v7 = @"hifispeaker.and.appletv";
    goto LABEL_69;
  }
  if ([v3 homePodCount] && objc_msgSend(v3, "homePodMiniCount"))
  {
    v7 = @"homepod.and.homepodmini.fill";
    goto LABEL_69;
  }
  if ([v3 homePodCount] && objc_msgSend(v3, "hifiCount"))
  {
    v7 = @"hifispeaker.and.homepod.fill";
    goto LABEL_69;
  }
  if ([v3 homePodMiniCount] && objc_msgSend(v3, "hifiCount"))
  {
    v7 = @"hifispeaker.and.homepodmini.fill";
    goto LABEL_69;
  }
  if ((unint64_t)[v3 homePodCount] > 1)
  {
    v7 = @"homepod.2.fill";
    goto LABEL_69;
  }
  if ([v3 homePodCount])
  {
    v7 = @"homepod.fill";
    goto LABEL_69;
  }
  if ((unint64_t)[v3 homePodMiniCount] > 1)
  {
    v7 = @"homepodmini.2.fill";
    goto LABEL_69;
  }
  if ([v3 homePodMiniCount])
  {
    v7 = @"homepodmini.fill";
    goto LABEL_69;
  }
  if ((unint64_t)[v3 hifiCount] > 1)
  {
    v7 = @"hifispeaker.2.fill";
    goto LABEL_69;
  }
  if ([v3 hifiCount])
  {
    v7 = @"hifispeaker.fill";
    goto LABEL_69;
  }
  if ([v3 atvCount])
  {
    v7 = @"appletv.fill";
    goto LABEL_69;
  }
  if ([v3 setTopCount])
  {
    v7 = @"tv.and.mediabox";
    goto LABEL_69;
  }
  if ([v3 tvStickCount])
  {
    v7 = @"mediastick";
    goto LABEL_69;
  }
  if ([v3 tvCount])
  {
    v7 = @"tv";
    goto LABEL_69;
  }
  if ([v3 macCount])
  {
    v7 = @"macbook";
    goto LABEL_69;
  }
  if ((unint64_t)[v3 headphoneCount] > 1)
  {
    v7 = @"person.2.fill";
    goto LABEL_69;
  }
  if ([v3 headphoneCount])
  {
    v7 = @"headphones";
    goto LABEL_69;
  }
  if ([v3 bluetoothSpeakerCount])
  {
    v7 = @"speaker.bluetooth.fill";
    goto LABEL_69;
  }
  if ([v3 carplayCount])
  {
    v7 = @"carplay";
    goto LABEL_69;
  }
  if ([v3 vehicleCount])
  {
    v7 = @"car.fill";
    goto LABEL_69;
  }
  if ([v3 legacyBeatsCount])
  {
    v7 = @"beatslogo";
    goto LABEL_69;
  }
  if ([v3 iPhoneCount])
  {
    v7 = @"iphone";
    goto LABEL_69;
  }
  if ([v3 visionCount])
  {
    v7 = @"vision.pro.fill";
    goto LABEL_69;
  }
  if ([v3 displayCount])
  {
    v7 = @"display";
    goto LABEL_69;
  }
  if ([v3 hearingDeviceCount])
  {
    v7 = @"hearingdevice.ear";
    goto LABEL_69;
  }
  if ([v3 lofiCount]) {
    goto LABEL_68;
  }
  if ([v3 builtInCount] != 1 || objc_msgSend(v3, "totalCount") != 1)
  {
    if ((unint64_t)[v3 builtInCount] <= 1) {
      [v3 unknownCount];
    }
LABEL_68:
    v7 = @"speaker.wave.2.fill";
    goto LABEL_69;
  }
  v7 = +[MRDeviceIdentifierSymbolProvider currentDeviceRoutingSymbolName];
LABEL_69:

  return v7;
}

@end