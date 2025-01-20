@interface MessagesAppInstallationObserver
- (_TtC10FitnessApp31MessagesAppInstallationObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
@end

@implementation MessagesAppInstallationObserver

- (_TtC10FitnessApp31MessagesAppInstallationObserver)init
{
  return (_TtC10FitnessApp31MessagesAppInstallationObserver *)sub_10069A140();
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp31MessagesAppInstallationObserver___observationRegistrar;
  uint64_t v3 = type metadata accessor for ObservationRegistrar();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end