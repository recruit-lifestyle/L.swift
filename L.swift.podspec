Pod::Spec.new do |s|
  s.name = 'L.swift'
  s.version = '1.0.0'
  s.summary = 'Use strong typed, autocompleted localized strings'
  s.homepage = 'https://github.com/recruit-lifestyle/L.swift'
  s.platform = :ios, '8.0'
  s.author = { 'Yuki Nagai' => 'ynagai@r.recruit.co.jp' }
  s.license = 'MIT'
  s.source = { :http => 'https://github.com/recruit-lifestyle/L.swift/releases/download/1.0.0/lswift-1.0.0.zip' }
  s.preserve_paths = 'lswift'
end
