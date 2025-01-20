@interface NTKCompanion1stPartyStocksApp
- (NTKCompanion1stPartyStocksApp)initWithDevice:(id)a3;
- (id)complication;
@end

@implementation NTKCompanion1stPartyStocksApp

- (NTKCompanion1stPartyStocksApp)initWithDevice:(id)a3
{
  id v5 = a3;
  v6 = NTKRemoteComplicationStocksClientIdentifier(v5);
  v12.receiver = self;
  v12.super_class = (Class)NTKCompanion1stPartyStocksApp;
  v7 = [(NTKCompanion3rdPartyApp *)&v12 _initWithWatchAppId:@"com.apple.stocks.watchapp" containerAppId:@"com.apple.stocks" complicationClientId:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_device, a3);
    [(NTKCompanion3rdPartyApp *)v7 setInstalled:1];
    v8 = [(NTKCompanion1stPartyStocksApp *)v7 complication];
    v9 = [v8 complicationDescriptor];
    v10 = [v9 supportedFamilies];
    [(NTKCompanion3rdPartyApp *)v7 setSupportedFamilies:v10];
  }
  return v7;
}

- (id)complication
{
  return +[NTKRemoteComplication _remoteStocksComplicationWithIdentifier:*MEMORY[0x1E4F19658] forDevice:self->_device];
}

- (void).cxx_destruct
{
}

@end